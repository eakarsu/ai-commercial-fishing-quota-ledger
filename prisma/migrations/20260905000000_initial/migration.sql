-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuotaAccount" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "holder" TEXT NOT NULL,
    "fishery" TEXT NOT NULL,
    "species" TEXT NOT NULL,
    "seasonStart" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuotaAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FishingVessel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "registrationNumber" TEXT NOT NULL,
    "permitNumber" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "capacityKg" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FishingVessel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuotaAllocation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "allocationNumber" TEXT NOT NULL,
    "allocatedKg" DOUBLE PRECISION NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuotaAllocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuotaTransfer" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "counterparty" TEXT NOT NULL,
    "direction" TEXT NOT NULL,
    "quantityKg" DOUBLE PRECISION NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuotaTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FishingTrip" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "fishingVesselId" TEXT NOT NULL,
    "tripNumber" TEXT NOT NULL,
    "departedAt" TIMESTAMP(3) NOT NULL,
    "returnedAt" TIMESTAMP(3) NOT NULL,
    "area" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FishingTrip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LandingRecord" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "fishingTripId" TEXT NOT NULL,
    "landedAt" TIMESTAMP(3) NOT NULL,
    "species" TEXT NOT NULL,
    "weightKg" DOUBLE PRECISION NOT NULL,
    "dealer" TEXT NOT NULL,
    "ticketNumber" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LandingRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LandingCorrection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "landingRecordId" TEXT NOT NULL,
    "correctedKg" DOUBLE PRECISION NOT NULL,
    "reason" TEXT NOT NULL,
    "correctedAt" TIMESTAMP(3) NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LandingCorrection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuotaLease" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "counterparty" TEXT NOT NULL,
    "direction" TEXT NOT NULL,
    "quantityKg" DOUBLE PRECISION NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "endAt" TIMESTAMP(3) NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuotaLease_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FisheryReport" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "reportedKg" DOUBLE PRECISION NOT NULL,
    "preparer" TEXT NOT NULL,
    "submissionReceipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FisheryReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "quotaAccountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "QuotaAccount_createdAt_idx" ON "QuotaAccount"("createdAt");

-- CreateIndex
CREATE INDEX "FishingVessel_createdAt_idx" ON "FishingVessel"("createdAt");

-- CreateIndex
CREATE INDEX "FishingVessel_quotaAccountId_idx" ON "FishingVessel"("quotaAccountId");

-- CreateIndex
CREATE INDEX "QuotaAllocation_createdAt_idx" ON "QuotaAllocation"("createdAt");

-- CreateIndex
CREATE INDEX "QuotaAllocation_quotaAccountId_idx" ON "QuotaAllocation"("quotaAccountId");

-- CreateIndex
CREATE INDEX "QuotaTransfer_createdAt_idx" ON "QuotaTransfer"("createdAt");

-- CreateIndex
CREATE INDEX "QuotaTransfer_quotaAccountId_idx" ON "QuotaTransfer"("quotaAccountId");

-- CreateIndex
CREATE INDEX "FishingTrip_createdAt_idx" ON "FishingTrip"("createdAt");

-- CreateIndex
CREATE INDEX "FishingTrip_quotaAccountId_idx" ON "FishingTrip"("quotaAccountId");

-- CreateIndex
CREATE INDEX "LandingRecord_createdAt_idx" ON "LandingRecord"("createdAt");

-- CreateIndex
CREATE INDEX "LandingRecord_quotaAccountId_idx" ON "LandingRecord"("quotaAccountId");

-- CreateIndex
CREATE INDEX "LandingCorrection_createdAt_idx" ON "LandingCorrection"("createdAt");

-- CreateIndex
CREATE INDEX "LandingCorrection_quotaAccountId_idx" ON "LandingCorrection"("quotaAccountId");

-- CreateIndex
CREATE INDEX "QuotaLease_createdAt_idx" ON "QuotaLease"("createdAt");

-- CreateIndex
CREATE INDEX "QuotaLease_quotaAccountId_idx" ON "QuotaLease"("quotaAccountId");

-- CreateIndex
CREATE INDEX "FisheryReport_createdAt_idx" ON "FisheryReport"("createdAt");

-- CreateIndex
CREATE INDEX "FisheryReport_quotaAccountId_idx" ON "FisheryReport"("quotaAccountId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_quotaAccountId_idx" ON "OperationalTask"("quotaAccountId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_quotaAccountId_idx" ON "RuleVersion"("quotaAccountId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_quotaAccountId_idx" ON "DocumentRequirement"("quotaAccountId");

-- AddForeignKey
ALTER TABLE "FishingVessel" ADD CONSTRAINT "FishingVessel_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuotaAllocation" ADD CONSTRAINT "QuotaAllocation_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuotaTransfer" ADD CONSTRAINT "QuotaTransfer_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FishingTrip" ADD CONSTRAINT "FishingTrip_fishingVesselId_fkey" FOREIGN KEY ("fishingVesselId") REFERENCES "FishingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FishingTrip" ADD CONSTRAINT "FishingTrip_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LandingRecord" ADD CONSTRAINT "LandingRecord_fishingTripId_fkey" FOREIGN KEY ("fishingTripId") REFERENCES "FishingTrip"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LandingRecord" ADD CONSTRAINT "LandingRecord_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LandingCorrection" ADD CONSTRAINT "LandingCorrection_landingRecordId_fkey" FOREIGN KEY ("landingRecordId") REFERENCES "LandingRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LandingCorrection" ADD CONSTRAINT "LandingCorrection_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuotaLease" ADD CONSTRAINT "QuotaLease_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FisheryReport" ADD CONSTRAINT "FisheryReport_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_quotaAccountId_fkey" FOREIGN KEY ("quotaAccountId") REFERENCES "QuotaAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

