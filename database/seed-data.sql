INSERT INTO lawyers (name, email, phone, practice_area, specializations, hourly_rate_range) VALUES
('Sarah Johnson', 'sjohnson@smithlaw.com', '+1-555-0101', 'Family Law', 
 ARRAY['Divorce', 'Child Custody', 'Adoption', 'Spousal Support'], '$250-$400'),
('Michael Chen', 'mchen@smithlaw.com', '+1-555-0102', 'Corporate Law', 
 ARRAY['Business Formation', 'Contracts', 'M&A', 'Employment Law'], '$300-$450'),
('Robert Martinez', 'rmartinez@smithlaw.com', '+1-555-0103', 'Real Estate Law', 
 ARRAY['Property Transactions', 'Leasing', 'Zoning', 'Title Issues'], '$275-$425');