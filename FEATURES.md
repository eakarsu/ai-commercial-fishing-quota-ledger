# Commercial Fishing Quota Ledger

Track quota allocations, leases/transfers, landings, remaining balances and permit-linked reporting.

## Implemented records

- **Quota Account**: name, account Number, holder, fishery, species, season Start, status.
- **Fishing Vessel**: name, registration Number, permit Number, owner, capacity Kg, status.
- **Quota Allocation**: title, allocation Number, allocated Kg, effective At, authorization Reference, status.
- **Quota Transfer**: title, counterparty, direction, quantity Kg, effective At, authorization Reference, status.
- **Fishing Trip**: title, trip Number, departed At, returned At, area, status.
- **Landing Record**: title, landed At, species, weight Kg, dealer, ticket Number, status.
- **Landing Correction**: title, corrected Kg, reason, corrected At, evidence, status.
- **Quota Lease**: title, counterparty, direction, quantity Kg, start At, end At, authorization Reference, status.
- **Fishery Report**: title, period Start, period End, reported Kg, preparer, submission Receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Landing ticket extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Species and unit reconciliation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Quota variance explanation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Transfer document completeness: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Landing correction brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Fishery report narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Fishing quota balance: Reconcile one fishery/species/season and normalized unit, with duplicate transaction detection and explicit overage.
- Quota Account evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
