CREATE TABLE `Class` (
  `id` integer PRIMARY KEY,
  `session_date` datetime,
  `session_id` integer,
  `mentor_id` integer
);

CREATE TABLE `Session_details` (
  `session_id` integer PRIMARY KEY,
  `session_heading` varchar(255),
  `session_topics` varchar(255),
  `session_date` datetime,
  `session_time` timestamp,
  `session_task` varchar(255),
  `recording_url` varchar(255),
  `join_url` varchar(255),
  `pre_read` varchar(255)
);

CREATE TABLE `Additional_Sessions` (
  `session_id` integer PRIMARY KEY,
  `session_heading` varchar(255),
  `session_topics` varchar(255),
  `session_date` datetime,
  `session_time` timestamp,
  `session_task` varchar(255),
  `recording_url` varchar(255),
  `join_url` varchar(255),
  `pre_read` varchar(255)
);

CREATE TABLE `Tasks` (
  `task_id` integer PRIMARY KEY,
  `title` varchar(255),
  `student_id` integer,
  `assigned_date` datetime,
  `submitted_date` datetime,
  `frontend_url` varchar(255),
  `deployed_url` varchar(255),
  `marks` integer,
  `remarks` varchar(255)
);

CREATE TABLE `Student_Profile` (
  `student_id` integer PRIMARY KEY,
  `name` varchar(255),
  `phone` integer,
  `email` varchar(255),
  `batch` varchar(255),
  `qualification` varchar(255),
  `year_of_passing` integer,
  `years_of_experience` integer,
  `notice_period` integer,
  `github_url` varchar(255),
  `portfolio_url` varchar(255),
  `resume_url` varchar(255)
);

CREATE TABLE `Mentor_profile` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `phone` integer,
  `email` varchar(255),
  `years_of_experience` integer,
  `notice_period` integer,
  `qualification` varchar(255),
  `batches` Array
);

CREATE TABLE `Dashboard` (
  `id` integer PRIMARY KEY,
  `submitted_tasks` integer,
  `pending_tasks` integer
);

CREATE TABLE `LeaderBoard` (
  `id` integer PRIMARY KEY,
  `student_name` varchar(255),
  `batch` varchar(255),
  `Learning` float
);

CREATE TABLE `Feedback` (
  `session_id` integer PRIMARY KEY,
  `session_rating` varchar(255),
  `mentor_rating` varchar(255),
  `session_feedback` varchar(255),
  `mentor_feedback` varchar(255),
  `key_takeaways` varchar(255)
);

CREATE TABLE `LeaveApplication` (
  `id` integer PRIMARY KEY,
  `student_id` integer,
  `leaveDate` date,
  `reason` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `Queries` (
  `id` integer,
  `query_category` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `Mock_interview` (
  `id` integer,
  `mockInterviewRound` integer,
  `student_id` integer,
  `interviewDate` datetime,
  `interviewerName` varchar(255),
  `attended` bool,
  `comments` varchar(255),
  `logicalScore` integer,
  `overallScore` integer,
  `recordingUrl` varchar(255)
);

ALTER TABLE `Student_Profile` ADD FOREIGN KEY (`student_id`) REFERENCES `Class` (`id`);

ALTER TABLE `Class` ADD FOREIGN KEY (`id`) REFERENCES `Session_details` (`session_id`);

ALTER TABLE `Class` ADD FOREIGN KEY (`id`) REFERENCES `Additional_Sessions` (`session_id`);

ALTER TABLE `Session_details` ADD FOREIGN KEY (`session_id`) REFERENCES `Feedback` (`session_id`);

ALTER TABLE `Additional_Sessions` ADD FOREIGN KEY (`session_id`) REFERENCES `Feedback` (`session_id`);

ALTER TABLE `Session_details` ADD FOREIGN KEY (`session_id`) REFERENCES `Tasks` (`task_id`);

ALTER TABLE `Class` ADD FOREIGN KEY (`id`) REFERENCES `Tasks` (`student_id`);

ALTER TABLE `Class` ADD FOREIGN KEY (`mentor_id`) REFERENCES `Mentor_profile` (`id`);

ALTER TABLE `Student_Profile` ADD FOREIGN KEY (`student_id`) REFERENCES `Dashboard` (`id`);

ALTER TABLE `Student_Profile` ADD FOREIGN KEY (`student_id`) REFERENCES `LeaderBoard` (`id`);

ALTER TABLE `Student_Profile` ADD FOREIGN KEY (`student_id`) REFERENCES `LeaveApplication` (`id`);

ALTER TABLE `Student_Profile` ADD FOREIGN KEY (`student_id`) REFERENCES `Queries` (`id`);

ALTER TABLE `Student_Profile` ADD FOREIGN KEY (`student_id`) REFERENCES `Mock_interview` (`id`);
