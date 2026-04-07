CREATE TABLE lawyers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    practice_area VARCHAR(100) NOT NULL,
    specializations TEXT[],
    hourly_rate_range VARCHAR(50),
    working_hours JSONB DEFAULT '{"monday": {"start": "09:00", "end": "17:00"}, "tuesday": {"start": "09:00", "end": "17:00"}, "wednesday": {"start": "09:00", "end": "17:00"}, "thursday": {"start": "09:00", "end": "17:00"}, "friday": {"start": "09:00", "end": "17:00"}}'::jsonb,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Clients Table
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20) NOT NULL UNIQUE,
    is_existing_client BOOLEAN DEFAULT false,
    preferred_lawyer_id INTEGER REFERENCES lawyers(id),
    legal_matter_category VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Appointments Table
CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    lawyer_id INTEGER REFERENCES lawyers(id) NOT NULL,
    client_id INTEGER REFERENCES clients(id) NOT NULL,
    appointment_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    duration_minutes INTEGER DEFAULT 60,
    consultation_type VARCHAR(50) DEFAULT 'initial',
    legal_matter_type VARCHAR(100),
    legal_matter_description TEXT,
    status VARCHAR(20) DEFAULT 'scheduled',
    urgency_level VARCHAR(20) DEFAULT 'normal',
    notes TEXT,
    reminder_24h_sent BOOLEAN DEFAULT false,
    reminder_day_of_sent BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW(),
    cancelled_at TIMESTAMP,
    cancellation_reason TEXT
);

-- Call Logs Table
CREATE TABLE call_logs (
    id SERIAL PRIMARY KEY,
    vapi_call_id VARCHAR(100),
    client_phone VARCHAR(20),
    duration_seconds INTEGER,
    transcript TEXT,
    intent VARCHAR(50),
    outcome VARCHAR(50),
    appointment_id INTEGER REFERENCES appointments(id),
    created_at TIMESTAMP DEFAULT NOW()
);