export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-commercial-fishing-quota-ledger",
  "title": "Commercial Fishing Quota Ledger",
  "tagline": "Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting.",
    "entities": [
      "QuotaAccount",
      "FishingVessel",
      "QuotaAllocation"
    ],
    "workflows": [
      "landing-ticket-extraction",
      "species-and-unit-reconciliation"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting.",
    "entities": [
      "QuotaTransfer",
      "FishingTrip",
      "LandingRecord"
    ],
    "workflows": [
      "quota-variance-explanation",
      "transfer-document-completeness"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting.",
    "entities": [
      "LandingCorrection",
      "QuotaLease",
      "FisheryReport"
    ],
    "workflows": [
      "landing-correction-brief",
      "fishery-report-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "QuotaAccount": {
    "name": "QuotaAccount",
    "label": "Quota Account",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "accountNumber",
        "kind": "string"
      },
      {
        "name": "holder",
        "kind": "string"
      },
      {
        "name": "fishery",
        "kind": "string"
      },
      {
        "name": "species",
        "kind": "string"
      },
      {
        "name": "seasonStart",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "FishingVessel": {
    "name": "FishingVessel",
    "label": "Fishing Vessel",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "registrationNumber",
        "kind": "string"
      },
      {
        "name": "permitNumber",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "capacityKg",
        "kind": "number"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "QuotaAllocation": {
    "name": "QuotaAllocation",
    "label": "Quota Allocation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "allocationNumber",
        "kind": "string"
      },
      {
        "name": "allocatedKg",
        "kind": "number"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "QuotaTransfer": {
    "name": "QuotaTransfer",
    "label": "Quota Transfer",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "counterparty",
        "kind": "string"
      },
      {
        "name": "direction",
        "kind": "string"
      },
      {
        "name": "quantityKg",
        "kind": "number"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "FishingTrip": {
    "name": "FishingTrip",
    "label": "Fishing Trip",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "fishingVesselId",
        "kind": "string"
      },
      {
        "name": "tripNumber",
        "kind": "string"
      },
      {
        "name": "departedAt",
        "kind": "date"
      },
      {
        "name": "returnedAt",
        "kind": "date"
      },
      {
        "name": "area",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "LandingRecord": {
    "name": "LandingRecord",
    "label": "Landing Record",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "fishingTripId",
        "kind": "string"
      },
      {
        "name": "landedAt",
        "kind": "date"
      },
      {
        "name": "species",
        "kind": "string"
      },
      {
        "name": "weightKg",
        "kind": "number"
      },
      {
        "name": "dealer",
        "kind": "string"
      },
      {
        "name": "ticketNumber",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "LandingCorrection": {
    "name": "LandingCorrection",
    "label": "Landing Correction",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "landingRecordId",
        "kind": "string"
      },
      {
        "name": "correctedKg",
        "kind": "number"
      },
      {
        "name": "reason",
        "kind": "string"
      },
      {
        "name": "correctedAt",
        "kind": "date"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "QuotaLease": {
    "name": "QuotaLease",
    "label": "Quota Lease",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "counterparty",
        "kind": "string"
      },
      {
        "name": "direction",
        "kind": "string"
      },
      {
        "name": "quantityKg",
        "kind": "number"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "endAt",
        "kind": "date"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "FisheryReport": {
    "name": "FisheryReport",
    "label": "Fishery Report",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "periodStart",
        "kind": "date"
      },
      {
        "name": "periodEnd",
        "kind": "date"
      },
      {
        "name": "reportedKg",
        "kind": "number"
      },
      {
        "name": "preparer",
        "kind": "string"
      },
      {
        "name": "submissionReceipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "quotaAccountId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "landing-ticket-extraction",
    "title": "Landing ticket extraction",
    "description": "Landing ticket extraction using selected quota account records and supplied evidence.",
    "prompt": "Landing ticket extraction for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "species-and-unit-reconciliation",
    "title": "Species and unit reconciliation",
    "description": "Species and unit reconciliation using selected quota account records and supplied evidence.",
    "prompt": "Species and unit reconciliation for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "quota-variance-explanation",
    "title": "Quota variance explanation",
    "description": "Quota variance explanation using selected quota account records and supplied evidence.",
    "prompt": "Quota variance explanation for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "transfer-document-completeness",
    "title": "Transfer document completeness",
    "description": "Transfer document completeness using selected quota account records and supplied evidence.",
    "prompt": "Transfer document completeness for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "landing-correction-brief",
    "title": "Landing correction brief",
    "description": "Landing correction brief using selected quota account records and supplied evidence.",
    "prompt": "Landing correction brief for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "fishery-report-narrative",
    "title": "Fishery report narrative",
    "description": "Fishery report narrative using selected quota account records and supplied evidence.",
    "prompt": "Fishery report narrative for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected quota account records and supplied evidence.",
    "prompt": "Evidence completeness review for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected quota account records and supplied evidence.",
    "prompt": "Operations handoff draft for Commercial Fishing Quota Ledger. Operational scope: Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting. Specific AI scope: Reconcile landing documents against quota balances and flag inconsistent units/species. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
