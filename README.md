# ⚖️ LegalAssist AI

**AI Voice Assistant for Law Firms** — Automated scheduling, client routing, and appointment management for a 3-lawyer practice.

[![Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

> 🎥 **[Watch the full demo (9 min)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)** — Live call recording, workflow execution, and database updates in real-time.

---

## The Problem

Law firms waste **10+ hours per week** on scheduling calls. Double-bookings happen, there's no after-hours coverage, and staff burns out on repetitive tasks.

## The Solution

LegalAssist AI handles the entire intake and scheduling process via phone, 24/7:

- **Smart routing** — Identifies the client's legal matter and matches them to the right attorney
- **Conflict-free booking** — Checks real-time availability before confirming any slot
- **Automated reminders** — SMS at 24 hours and day-of appointment
- **Urgent handling** — Transfers time-sensitive matters to staff immediately
- **Quick consults** — Schedules same-day phone consultations when available

---

## Architecture

```
Client Calls → Vapi (Voice AI) → n8n Workflows → Supabase (Database)
                                       ↓
                                  Twilio (SMS)
```

| Component | Role |
|-----------|------|
| **Vapi** | Voice AI platform — speech-to-text, GPT-4 conversation, text-to-speech |
| **n8n** | Workflow automation — webhook handlers, business logic, API orchestration |
| **Supabase** | PostgreSQL database — lawyers, clients, appointments, call logs |
| **Twilio** | SMS confirmations and appointment reminders |
| **ElevenLabs** | Natural-sounding voice responses |

---

## Lawyers Configured

| Attorney | Practice Area | Specializations |
|----------|--------------|-----------------|
| Sarah Johnson | Family Law | Divorce, Child Custody, Adoption, Spousal Support |
| Michael Chen | Corporate Law | Business Formation, Contracts, M&A, Employment Law |
| Robert Martinez | Real Estate Law | Property Transactions, Leasing, Zoning, Title Issues |

---

## n8n Workflows

| # | Workflow | Trigger | What It Does |
|---|----------|---------|-------------|
| 1 | Check Availability | Vapi webhook | Queries Supabase for open slots on a given date |
| 2 | Book Appointment | Vapi webhook | Creates client + appointment records, sends SMS confirmation |
| 3 | Cancel Appointment | Vapi webhook | Updates appointment status, notifies client via SMS |
| 4 | 24-Hour Reminder | Cron (daily 9 AM) | Finds tomorrow's appointments, sends SMS reminders |
| 5 | Day-Of Reminder | Cron (daily 7 AM) | Sends morning-of SMS reminders |
| 6 | Urgent Transfer | Vapi webhook | Routes urgent calls to staff phone |

---

## Database Schema

Four core tables in Supabase (PostgreSQL):

- **lawyers** — Attorney profiles, practice areas, working hours
- **clients** — Client contact info, preferred lawyer, legal matter category
- **appointments** — Scheduled consultations with status tracking and reminder flags
- **call_logs** — Vapi call records with transcripts, intent, and outcome

> See [`/database/schema.sql`](./database/schema.sql) for the full schema with indexes and views.

---

## Demo Highlights

| Timestamp | What You'll See |
|-----------|----------------|
| 0:30 | Problem & solution overview |
| 1:30 | System architecture walkthrough |
| 3:00 | Database design tour |
| 4:00 | **Live call demo** — booking a divorce consultation |
| 6:30 | n8n workflow deep dive |
| 8:00 | Results and impact metrics |

---

## Setup

### Prerequisites

- Docker (for self-hosted n8n) or Railway account
- Supabase account (free tier works)
- Vapi account
- Twilio account (for SMS)

### Quick Start

1. **Clone this repo**
   ```bash
   git clone https://github.com/YOUR_USERNAME/legalassist-ai.git
   cd legalassist-ai
   ```

2. **Start n8n**
   ```bash
   docker-compose up -d
   # Access at http://localhost:5678
   ```

3. **Set up Supabase**
   - Create a project at [supabase.com](https://supabase.com)
   - Run `database/schema.sql` in the SQL editor

4. **Import n8n workflows**
   - Open n8n → Import from file
   - Import all JSON files from `/workflows/`

5. **Configure Vapi**
   - Create an assistant with the system prompt from `/vapi/system-prompt.txt`
   - Set the server URL to your n8n webhook endpoint

6. **Set environment variables**
   - Supabase URL and API keys
   - Twilio SID, auth token, and phone number
   - Vapi API key

---

## Project Structure

```
legalassist-ai/
├── workflows/              # n8n workflow JSON exports
│   ├── check-availability.json
│   ├── book-appointment.json
│   ├── cancel-appointment.json
│   ├── reminder-24h.json
│   ├── reminder-day-of.json
│   └── urgent-transfer.json
├── database/
│   ├── schema.sql          # Full database schema
│   └── seed-data.sql       # Sample lawyer data
├── vapi/
│   └── system-prompt.txt   # AI receptionist prompt
├── docs/
│   └── architecture.png    # System architecture diagram
├── docker-compose.yml
└── README.md
```

---

## Cost Breakdown

| Service | Monthly Cost |
|---------|-------------|
| n8n hosting (Railway) | $5–10 |
| Supabase | Free tier |
| Vapi (100 calls/mo) | $45–120 |
| OpenAI / Claude | $9–27 |
| ElevenLabs | $5–14 |
| Twilio SMS | $1–3 |
| **Total** | **$65–175/month** |

---

## Skills Demonstrated

- Workflow automation and visual programming (n8n)
- Database design and SQL (PostgreSQL / Supabase)
- REST API integration and webhook architecture
- Voice AI implementation (Vapi + GPT-4 + ElevenLabs)
- Production deployment (Docker, Railway)
- System architecture and error handling

---

## License

This project is for portfolio and educational purposes.

---

**Built by [Your Name]** · [LinkedIn](https://linkedin.com/in/YOUR_PROFILE) · [Email](mailto:your.email@example.com)
