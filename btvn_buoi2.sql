-- Bài 1
-- 1. Tạo bảng Class
CREATE TABLE class (
    class_id VARCHAR(20) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    academic_year YEAR NOT NULL
);

-- 2. Tạo bảng Student 
CREATE TABLE student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE,
    class_id VARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES class(class_id) ON DELETE RESTRICT
);

-- Bài 2
-- Tạo bảng Subject với ràng buộc CHECK
CREATE TABLE subject (
    subject_id VARCHAR(20) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    credits INT CHECK (credits > 0)
);

-- Bài 3
-- Bảng trung gian xử lý quan hệ N-N
CREATE TABLE enrollment (
    student_id VARCHAR(20),
    subject_id VARCHAR(20),
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    
    -- Composite Key: Khóa chính kép
    PRIMARY KEY (student_id, subject_id),
    
    -- Khóa ngoại nối về 2 bảng gốc
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id) ON DELETE CASCADE
);