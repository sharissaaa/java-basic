-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 05:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icssr_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `assessment_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `assessment_name`, `description`, `version`, `created_at`) VALUES
(1, 'Comprehensive Resident Assessment', 'A comprehensive assessment combining WHODAS 2.0, SOFS, and WHOQoL-BREF.', '1.0', '2025-07-09 19:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_change_summaries`
--

CREATE TABLE `assessment_change_summaries` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `previous_assessment_id` int(11) DEFAULT NULL,
  `current_assessment_id` int(11) NOT NULL,
  `changes_summary` text DEFAULT NULL,
  `domain_improvements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `domain_no_change` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `domain_worsened` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by_staff_id` int(11) NOT NULL,
  `generated_by_ai` tinyint(1) NOT NULL,
  `ai_model_version` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_change_summaries`
--

INSERT INTO `assessment_change_summaries` (`id`, `patient_id`, `previous_assessment_id`, `current_assessment_id`, `changes_summary`, `domain_improvements`, `domain_no_change`, `domain_worsened`, `created_by_staff_id`, `generated_by_ai`, `ai_model_version`, `created_at`) VALUES
(15, 1, 1, 2, '{\"overall_summary\": \"The resident demonstrates a mixed trajectory, with marginal improvement in functioning but overall increases in disability and declines in quality of life scores. While some domains indicate stabilization, others reflect emerging challenges requiring focused intervention.\", \"key_observational_insights\": \"The clinical status of \'moderately stabilized\' suggests partial symptom control, but this is not fully reflected in the assessment scores, which show increased disability and reduced quality of life. Despite stabilization, there may be underlying barriers\\u2014such as increased cognitive and participation difficulties\\u2014that contribute to the resident\'s ongoing challenges.\", \"previous_plan_review\": \"Previous care plan goals showed significant progress in medication adherence and moderate to some progress in cognitive, mobility, social, and community participation. However, self-care abilities have stagnated, and improvements in life activities and social relationships have not translated into sustained functional gains. Renewed emphasis is needed on self-care and supporting social integration to counteract the observed declines in key domains.\", \"domain_analysis\": [{\"domain_name\": \"WHODAS 2.0 Overall Score\", \"previous_score\": 55.47, \"current_score\": 61.72, \"change_status\": \"Declined\", \"analysis\": \"Overall disability has increased, indicating worsening global functioning since the last assessment.\"}, {\"domain_name\": \"WHODAS Domain 1: Cognition\", \"previous_score\": 50.0, \"current_score\": 70.83, \"change_status\": \"Declined\", \"analysis\": \"Significantly increased cognitive impairment is evident, suggesting greater struggles with understanding and communication.\"}, {\"domain_name\": \"WHODAS Domain 2: Mobility\", \"previous_score\": 60.0, \"current_score\": 55.0, \"change_status\": \"Improved\", \"analysis\": \"Slight improvement in mobility, reflecting some success in targeted interventions.\"}, {\"domain_name\": \"WHODAS Domain 3: Self-Care\", \"previous_score\": 75.0, \"current_score\": 75.0, \"change_status\": \"No Change\", \"analysis\": \"Self-care ability remains unchanged, continuing to be a substantial area of concern.\"}, {\"domain_name\": \"WHODAS Domain 4: Getting Along\", \"previous_score\": 65.0, \"current_score\": 60.0, \"change_status\": \"Improved\", \"analysis\": \"Slight improvement in social interactions, but scores remain high and indicative of ongoing difficulties.\"}, {\"domain_name\": \"WHODAS Domain 5: Life Activities\", \"previous_score\": 37.5, \"current_score\": 50.0, \"change_status\": \"Declined\", \"analysis\": \"Disability in life activities has increased, likely impacting day-to-day productivity and independence.\"}, {\"domain_name\": \"WHODAS Domain 6: Participation\", \"previous_score\": 50.0, \"current_score\": 59.38, \"change_status\": \"Declined\", \"analysis\": \"Increased difficulty in participation highlights growing challenges engaging in society and community life.\"}, {\"domain_name\": \"SOFS Overall Scaled Score\", \"previous_score\": 55.36, \"current_score\": 50.0, \"change_status\": \"Improved\", \"analysis\": \"Functioning shows marginal improvement, though gains may not offset increased disability elsewhere.\"}, {\"domain_name\": \"WHOQoL Physical Health\", \"previous_score\": 57.14, \"current_score\": 39.29, \"change_status\": \"Declined\", \"analysis\": \"Quality of life in physical health has deteriorated, warranting further medical and supportive review.\"}, {\"domain_name\": \"WHOQoL Psychological\", \"previous_score\": 37.5, \"current_score\": 33.33, \"change_status\": \"Declined\", \"analysis\": \"Psychological well-being has decreased further, signaling increased emotional and mental health challenges.\"}, {\"domain_name\": \"WHOQoL Social Relationships\", \"previous_score\": 75.0, \"current_score\": 25.0, \"change_status\": \"Declined\", \"analysis\": \"A marked decline in social relationships suggests substantial isolation or breakdown of support networks.\"}, {\"domain_name\": \"WHOQoL Environment\", \"previous_score\": 18.75, \"current_score\": 25.0, \"change_status\": \"Improved\", \"analysis\": \"There is a minor improvement in environmental quality of life, yet overall this remains a domain requiring further attention.\"}, {\"domain_name\": \"WHOQoL Overall Quality of Life\", \"previous_score\": 0.0, \"current_score\": 25.0, \"change_status\": \"Improved\", \"analysis\": \"Overall perception of quality of life has improved, though still remains low and below population norms.\"}, {\"domain_name\": \"WHOQoL General Health\", \"previous_score\": 75.0, \"current_score\": 25.0, \"change_status\": \"Declined\", \"analysis\": \"General health perception has declined dramatically, highlighting emerging or unaddressed health concerns.\"}]}', NULL, NULL, NULL, 1, 1, NULL, '2025-08-02 09:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_questions`
--

CREATE TABLE `assessment_questions` (
  `id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `question_code` varchar(50) NOT NULL,
  `question_text` text NOT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `response_type` enum('scale','number','boolean','text','date') NOT NULL,
  `instruction` text DEFAULT NULL,
  `checklist_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_questions`
--

INSERT INTO `assessment_questions` (`id`, `assessment_id`, `question_code`, `question_text`, `domain`, `response_type`, `instruction`, `checklist_options`, `is_active`) VALUES
(1, 1, 'WHODAS_D1_1', 'Concentrating on doing something for ten minutes?', 'WHODAS: Cognition', 'scale', 'Ask the resident/proxy to think back over the past 30 days and answer these questions, thinking about how much difficulty the resident had doing the following activities. If the question is not applicable in the last thirty days, mark as “Not applicable”.', NULL, 1),
(2, 1, 'WHODAS_D1_2', 'Remembering to do important things?', 'WHODAS: Cognition', 'scale', NULL, NULL, 1),
(3, 1, 'WHODAS_D1_3', 'Analysing and finding solutions to problems in day-to-day life?', 'WHODAS: Cognition', 'scale', NULL, NULL, 1),
(4, 1, 'WHODAS_D1_4', 'Learning a new task, for example, learning how to get to a new place?', 'WHODAS: Cognition', 'scale', NULL, NULL, 1),
(5, 1, 'WHODAS_D1_5', 'Generally understanding what people say?', 'WHODAS: Cognition', 'scale', NULL, NULL, 1),
(6, 1, 'WHODAS_D1_6', 'Starting and maintaining a conversation?', 'WHODAS: Cognition', 'scale', NULL, NULL, 1),
(7, 1, 'WHODAS_D2_1', 'Standing for long periods such as 30 minutes?', 'WHODAS: Mobility', 'scale', NULL, NULL, 1),
(8, 1, 'WHODAS_D2_2', 'Standing up from sitting down?', 'WHODAS: Mobility', 'scale', NULL, NULL, 1),
(9, 1, 'WHODAS_D2_3', 'Moving around inside your home?', 'WHODAS: Mobility', 'scale', NULL, NULL, 1),
(10, 1, 'WHODAS_D2_4', 'Getting out of your home?', 'WHODAS: Mobility', 'scale', NULL, NULL, 1),
(11, 1, 'WHODAS_D2_5', 'Walking a long distance such as a kilometre [or equivalent]?', 'WHODAS: Mobility', 'scale', NULL, NULL, 1),
(12, 1, 'WHODAS_D3_1', 'Washing your whole body?', 'WHODAS: Self-Care', 'scale', NULL, NULL, 1),
(13, 1, 'WHODAS_D3_2', 'Getting dressed?', 'WHODAS: Self-Care', 'scale', NULL, NULL, 1),
(14, 1, 'WHODAS_D3_3', 'Eating?', 'WHODAS: Self-Care', 'scale', NULL, NULL, 1),
(15, 1, 'WHODAS_D3_4', 'Staying by yourself for a few days?', 'WHODAS: Self-Care', 'scale', NULL, NULL, 1),
(16, 1, 'WHODAS_D4_1', 'Dealing with people you do not know?', 'WHODAS: Getting Along', 'scale', NULL, NULL, 1),
(17, 1, 'WHODAS_D4_2', 'Maintaining a friendship?', 'WHODAS: Getting Along', 'scale', NULL, NULL, 1),
(18, 1, 'WHODAS_D4_3', 'Getting along with people who are close to you?', 'WHODAS: Getting Along', 'scale', NULL, NULL, 1),
(19, 1, 'WHODAS_D4_4', 'Making new friends?', 'WHODAS: Getting Along', 'scale', NULL, NULL, 1),
(20, 1, 'WHODAS_D4_5', 'Sexual activities?', 'WHODAS: Getting Along', 'scale', NULL, NULL, 1),
(21, 1, 'WHODAS_D5_1', 'Taking care of your household responsibilities?', 'WHODAS: Life Activities', 'scale', 'Because of your health condition, in the past 30 days, how much difficulty did you have in:', NULL, 1),
(22, 1, 'WHODAS_D5_2', 'Doing your most important household tasks well?', 'WHODAS: Life Activities', 'scale', NULL, NULL, 1),
(23, 1, 'WHODAS_D5_3', 'Getting all the household work done that you needed to do?', 'WHODAS: Life Activities', 'scale', NULL, NULL, 1),
(24, 1, 'WHODAS_D5_4', 'Getting your household work done as quickly as needed?', 'WHODAS: Life Activities', 'scale', NULL, NULL, 1),
(25, 1, 'WHODAS_D5_01', 'In the past 30 days, on how many days did you reduce or completely miss household work because of your health condition?', 'WHODAS: Life Activities', 'number', NULL, NULL, 1),
(26, 1, 'WHODAS_D5_work_status', 'Does the resident work?', 'WHODAS: Life Activities', 'boolean', NULL, NULL, 1),
(27, 1, 'WHODAS_D5_5', 'Your day-to-day work/school?', 'WHODAS: Life Activities (Work)', 'scale', 'Because of your health condition, in the past 30 days, how much difficulty did you have in:', NULL, 1),
(28, 1, 'WHODAS_D5_6', 'Doing your most important work/school tasks well?', 'WHODAS: Life Activities (Work)', 'scale', NULL, NULL, 1),
(29, 1, 'WHODAS_D5_7', 'Getting all the work done that you need to do?', 'WHODAS: Life Activities (Work)', 'scale', NULL, NULL, 1),
(30, 1, 'WHODAS_D5_8', 'Getting your work done as quickly as needed?', 'WHODAS: Life Activities (Work)', 'scale', NULL, NULL, 1),
(31, 1, 'WHODAS_D5_9', 'Have you had to work at a lower level because of a health condition?', 'WHODAS: Life Activities (Work)', 'boolean', NULL, NULL, 1),
(32, 1, 'WHODAS_D5_10', 'Did you earn less money as the result of a health condition?', 'WHODAS: Life Activities (Work)', 'boolean', NULL, NULL, 1),
(33, 1, 'WHODAS_D5_02', 'In the past 30 days, on how many days did you miss work for half a day or more because of your health condition?', 'WHODAS: Life Activities (Work)', 'number', NULL, NULL, 1),
(34, 1, 'WHODAS_D6_1', 'How much of a problem did you have joining in community activities (for example, festivities, religious or other activities) in the same way as anyone else can?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(35, 1, 'WHODAS_D6_2', 'How much of a problem did you have because of barriers or hindrances in the world around you?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(36, 1, 'WHODAS_D6_3', 'How much of a problem did you have living with dignity because of the attitudes and actions of others?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(37, 1, 'WHODAS_D6_4', 'How much time did you spend on your health condition or its consequences?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(38, 1, 'WHODAS_D6_5', 'How much have you been emotionally affected by your health condition?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(39, 1, 'WHODAS_D6_6', 'How much has your health been a drain on the financial resources of you or your family?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(40, 1, 'WHODAS_D6_7', 'How much of a problem did your family have because of your health problems?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(41, 1, 'WHODAS_D6_8', 'How much of a problem did you have in doing things by yourself for relaxation or pleasure?', 'WHODAS: Participation', 'scale', NULL, NULL, 1),
(42, 1, 'WHODAS_H1', 'Overall, in the past 30 days, how many days were these difficulties present?', 'WHODAS: Overall Health', 'number', NULL, NULL, 1),
(43, 1, 'WHODAS_H2', 'In the past 30 days, for how many days were you totally unable to carry out your usual activities or work because of any health condition?', 'WHODAS: Overall Health', 'number', NULL, NULL, 1),
(44, 1, 'WHODAS_H3', 'In the past 30 days, not counting the days that you were totally unable, for how many days did you cut back or reduce your usual activities or work because of any health condition?', 'WHODAS: Overall Health', 'number', NULL, NULL, 1),
(45, 1, 'SOFS_1', 'Bathing and grooming: Quality and regularity of personal hygiene and bodily care', 'SOFS: Social-Occupational Functioning', 'scale', 'General rating scale: 1=no impairment, 2=mild impairment, 3=moderate impairment, 4=severe impairment, 5=extreme impairment. After giving a score, select specific areas of impairment.', '[\"Dental care\", \"Taking a bath\", \"Managing menstruation\", \"Hair care\", \"Skin care\", \"Using the toilet\", \"Nail care\", \"Removal of facial and body hair\"]', 1),
(46, 1, 'SOFS_2', 'Clothing and dressing: Ability to dress appropriately and maintain own clothing', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Choosing clean clothing\", \"Appropriate choice of clothing according to weather/occasion\", \"Independent dressing\", \"Completing laundry\", \"Notifying staff if clothing needs repair or replacement\"]', 1),
(47, 1, 'SOFS_3', 'Eating, feeding and diet: Eating habits, food intake and preparation of simple meal', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Attending scheduled meals in the dining area\", \"Identifying hunger\", \"Eating adequately\", \"Appropriate use of eating utensils\", \"Participating in meal preparation\", \"Following dietary restrictions\"]', 1),
(48, 1, 'SOFS_4', 'Neatness and maintenance activities: Ability to maintain own living area and contribute to household maintenance tasks', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Making one\\u2019s own bed\", \"Sweeping and mopping the floor\", \"Keeping personal space tidy\", \"Organizing personal belongings\", \"Interest in personal d\\u00e9cor and aesthetics\", \"Washing own dishes\", \"Disposing garbage\"]', 1),
(49, 1, 'SOFS_5', 'Conversational skills: Ability to initiate, maintain and terminate conversation and non-verbal skills', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Initiating conversations with staff and residents\", \"Staying on topic\", \"Maintaining appropriate eye contact\", \"Appropriate use of tone and volume\", \"Understanding verbal cues\", \"Expressing needs and preferences to staff\"]', 1),
(50, 1, 'SOFS_6', 'Social appropriateness/politeness: Ability to interact in a socially appropriate and polite manner', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Appropriate and polite greetings\", \"Respecting personal space\", \"Managing emotions in social setting\", \"Recognizing other\\u2019s feelings and responding appropriately\", \"Understanding social rules and customs\", \"Following time and schedule for activities\"]', 1),
(51, 1, 'SOFS_7', 'Social engagement: Ability to form and maintain close, stable relationships outside of the immediate family', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Interactions with residents and staff\", \"Participating in group activities\", \"Attending supervised outings\", \"Forming friendships/acquaintances with residents and staff\", \"Offering support to fellow residents\", \"Receiving support from residents and staff\", \"Resolving conflicts with residents and staff\", \"Interest in forming new connections\"]', 1),
(52, 1, 'SOFS_8', 'Money management: Ability to calculate correct change, understand the value of money, budget and spend money wisely', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Identifying currency denominations\", \"Manages personal allowance\", \"Understanding value of money\", \"Understanding basic financial concepts\", \"Making simple purchases\", \"Tracking income and expenses\"]', 1),
(53, 1, 'SOFS_9', 'Orientation/mobility: Awareness and knowledge of frequently used routes, ability to move about alone, use public transport', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Awareness of current location and time\", \"Navigating the compounds of the organization\", \"Moving independently without support\", \"Ability to use public transport\", \"Understanding and following directions for simple routes\"]', 1),
(54, 1, 'SOFS_10', 'Instrumental social skills: Understanding of social roles, contact appropriate persons (e.g. doctor) directly or through communication', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Making request to staff for assistance or supplies\", \"Using facility phone to make personal calls\", \"Attending scheduled appointments\", \"Understanding roles of professionals involved in their care\", \"Recognizing and communicating when not feeling well\"]', 1),
(55, 1, 'SOFS_11', 'Recreation/leisure: Interest and participation in passive and active leisure activities', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Participating in recreational activities\", \"Using free time for leisure or preferred activity\", \"Engaging in passive leisure activities\", \"Engaging in active leisure activities\"]', 1),
(56, 1, 'SOFS_12', 'Work: Ability to spend time in a structured and meaningful way; includes gainful employment, household work or studying', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Participating in assigned facility duties or chores consistently\", \"Attending vocational rehabilitation groups or programs\", \"Completing tasks or activities assigned\", \"Travelling to place of employment/study\"]', 1),
(57, 1, 'SOFS_13', 'Respect for property: Understanding of the difference between own and others’ property', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Differentiating between personal and other\\u2019s properties\", \"Asking permission before borrowing or using items belonging to others or the organization\", \"Returning borrowed items promptly\", \"Taking care of personal belongings and property\", \"Taking care of common belongings\"]', 1),
(58, 1, 'SOFS_14', 'Independence/responsibility: Ability to take care of self and others if left alone, follow general safety measures', 'SOFS: Social-Occupational Functioning', 'scale', NULL, '[\"Adhering to rules and guidelines\", \"Managing personal hygiene and self-care routines\", \"Participating in managing own medication\", \"Taking responsibility for minor mistakes or actions\", \"Following safety instructions and procedures\"]', 1),
(59, 1, 'QOL_1', 'How would you rate your quality of life?', 'WHOQoL: Overall', 'scale', NULL, NULL, 1),
(60, 1, 'QOL_2', 'How satisfied are you with your health?', 'WHOQoL: Overall', 'scale', NULL, NULL, 1),
(61, 1, 'QOL_3', 'To what extent do you feel that (physical) pain prevents you from doing what you need to do?', 'WHOQoL: Physical Health', 'scale', 'The following questions ask about how much you have experienced certain things in the last two weeks.', NULL, 1),
(62, 1, 'QOL_4', 'How much do you need any medical treatment to function in your daily life?', 'WHOQoL: Physical Health', 'scale', NULL, NULL, 1),
(63, 1, 'QOL_5', 'How much do you enjoy life?', 'WHOQoL: Psychological', 'scale', NULL, NULL, 1),
(64, 1, 'QOL_6', 'To what extent do you feel your life to be meaningful?', 'WHOQoL: Psychological', 'scale', NULL, NULL, 1),
(65, 1, 'QOL_7', 'How well are you able to concentrate?', 'WHOQoL: Psychological', 'scale', NULL, NULL, 1),
(66, 1, 'QOL_8', 'How safe do you feel in your daily life?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(67, 1, 'QOL_9', 'How healthy is your physical environment?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(68, 1, 'QOL_10', 'Do you have enough energy for everyday life?', 'WHOQoL: Physical Health', 'scale', 'The following questions ask about how completely you experience or were able to do certain things in the last two weeks.', NULL, 1),
(69, 1, 'QOL_11', 'Are you able to accept your bodily appearance?', 'WHOQoL: Psychological', 'scale', NULL, NULL, 1),
(70, 1, 'QOL_12', 'Have you enough money to meet your needs?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(71, 1, 'QOL_13', 'How available to you is the information that you need in your day-to-day life?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(72, 1, 'QOL_14', 'To what extent do you have the opportunity for leisure activities?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(73, 1, 'QOL_15', 'How well are you able to get around?', 'WHOQoL: Physical Health', 'scale', NULL, NULL, 1),
(74, 1, 'QOL_16', 'How satisfied are you with your sleep?', 'WHOQoL: Physical Health', 'scale', 'The following questions ask you to say how good or satisfied you have felt about various aspects of your life over the last two weeks.', NULL, 1),
(75, 1, 'QOL_17', 'How satisfied are you with your ability to perform your daily living activities?', 'WHOQoL: Physical Health', 'scale', NULL, NULL, 1),
(76, 1, 'QOL_18', 'How satisfied are you with your capacity for work?', 'WHOQoL: Physical Health', 'scale', NULL, NULL, 1),
(77, 1, 'QOL_19', 'How satisfied are you with yourself?', 'WHOQoL: Psychological', 'scale', NULL, NULL, 1),
(78, 1, 'QOL_20', 'How satisfied are you with your personal relationships?', 'WHOQoL: Social Relationships', 'scale', NULL, NULL, 1),
(79, 1, 'QOL_21', 'How satisfied are you with your sex life?', 'WHOQoL: Social Relationships', 'scale', NULL, NULL, 1),
(80, 1, 'QOL_22', 'How satisfied are you with the support you get from your friends?', 'WHOQoL: Social Relationships', 'scale', NULL, NULL, 1),
(81, 1, 'QOL_23', 'How satisfied are you with the conditions of your living place?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(82, 1, 'QOL_24', 'How satisfied are you with your access to health services?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(83, 1, 'QOL_25', 'How satisfied are you with your transport?', 'WHOQoL: Environment', 'scale', NULL, NULL, 1),
(84, 1, 'QOL_26', 'How often do you have negative feelings such as blue mood, despair, anxiety, depression?', 'WHOQoL: Psychological', 'scale', 'The following question refers to how often you have felt or experienced certain things in the last two weeks.', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `care_plan_goals`
--

CREATE TABLE `care_plan_goals` (
  `id` int(11) NOT NULL,
  `treatment_plan_id` int(11) NOT NULL,
  `needs_category` varchar(255) NOT NULL,
  `goal` text DEFAULT NULL,
  `intervention` text DEFAULT NULL,
  `rationale` text DEFAULT NULL,
  `display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `care_plan_goals`
--

INSERT INTO `care_plan_goals` (`id`, `treatment_plan_id`, `needs_category`, `goal`, `intervention`, `rationale`, `display_order`) VALUES
(6, 2, 'Pharmacological', 'To maintain medication adherence for psychiatric and physical health conditions.', 'Weekly monitoring of medication adherence by healthcare staff.', 'Ensuring adherence to prescribed medications to stabilize psychiatric symptoms and manage diabetes, hypertension, and skin infections.', 0),
(7, 2, 'Cognitive', 'To improve cognitive functioning by 10% within 3 months.', 'Participation in cognitive behavioral group therapy sessions available 24/7.', 'Group therapy can help enhance cognitive functioning and provide coping strategies for managing symptoms.', 1),
(8, 2, 'Mobility', 'To reduce mobility challenges by 10% within 3 months.', 'Engage in a daily physical activity program tailored by a physiotherapist.', 'Regular physical activity may improve mobility and overall physical health.', 2),
(9, 2, 'Self-Care', 'To achieve a 20% improvement in self-care abilities within 6 months.', 'Enlist in a self-care skills training program with weekly progress tracking.', 'Improving self-care skills is crucial for independent living and overall well-being.', 3),
(10, 2, 'Life Activities', 'To increase participation in meaningful life activities by 20% within 6 months.', 'Develop a personalized vocational training plan and explore part-time employment opportunities.', 'Engaging in work and learning can improve self-esteem and facilitate independent living.', 4),
(11, 2, 'Social Life', 'To enhance social interactions and relationships by attending at least two social events per month.', 'Facilitate participation in social skills group therapy and community events.', 'Improving social skills and relationships is essential for community reintegration and emotional health.', 5),
(12, 2, 'Participation', 'To increase participation in community activities by 15% within 6 months.', 'Encourage involvement in local community services and support groups.', 'Active participation in the community can reduce isolation and improve quality of life.', 6),
(267, 26, 'Immediate stabilization of acute psychosis and persistent aggression.', 'To achieve and maintain psychiatric stability and reduce aggressive behavior.', 'Resident will receive prescribed antipsychotic medication (Haloperidol 5mg) under direct supervision of nursing staff daily, with crisis intervention and emergency sedation as needed, for the next 12 weeks.', 'Supervised administration ensures adherence, which is critical for resolving acute psychotic symptoms and managing hostility, thus reducing risks to self and others.', 0),
(268, 26, 'Management of anaemia and underweight status.', 'To improve physical health and nutritional status.', 'Resident will receive daily medical monitoring, nutritional supplements, and dietary adjustments by nursing staff for the next 12 weeks, with laboratory tests repeated monthly.', 'Addressing anaemia and undernutrition supports overall recovery and reduces vulnerability to infection and fatigue.', 1),
(269, 26, 'Severe impairment in concentration, memory, and problem-solving due to active psychosis.', 'To enhance cognitive functioning and orientation.', 'Resident will participate in weekly gender-specific group sessions focused on memory and concentration games, with staff facilitation and encouragement for the next 12 weeks.', 'Structured cognitive activities can help maintain and gradually improve attention, memory, and problem-solving, even during early recovery.', 2),
(270, 26, 'Difficulty getting out of the facility and limited mobility outside her room.', 'To maintain and improve basic mobility within the facility.', 'Resident will be supported by staff to walk within the ward or participate in supervised outdoor walks during group sessions once per week for the next 8 weeks.', 'Regular, supported movement helps prevent deconditioning, supports physical health, and reduces risk of further mobility decline.', 3),
(271, 26, 'Inability to independently manage personal hygiene, grooming, dressing, and eating.', 'To improve independence in basic self-care activities.', 'Resident will receive daily prompts and hands-on assistance from caregivers for bathing, dressing, oral hygiene, and eating, with monitoring documented by nursing staff for the next 12 weeks.', 'Regular assistance and prompting will help re-establish self-care routines, support dignity, and prevent health complications.', 4),
(272, 26, 'Total inability to perform household tasks or participate in structured activities.', 'To initiate participation in basic facility-based activities.', 'Resident will be encouraged to participate in weekly group activity-based sessions (e.g., newspaper reading, simple sorting tasks) with one-on-one staff support for the next 8 weeks.', 'Gradual re-engagement in structured activities can foster routine, enhance skills, and serve as a foundation for future vocational participation.', 5),
(273, 26, 'Complete social withdrawal and hostile interactions with staff and peers.', 'To reduce hostility and improve basic social interaction skills.', 'Resident will participate in weekly gender-specific group sessions focused on social skills and will receive daily staff modeling of positive social interactions for the next 12 weeks.', 'Consistent exposure to structured social settings and staff modeling provides opportunities to practice and reinforce appropriate social behaviors.', 6),
(274, 26, 'Profound restriction from community activities and inability to engage in leisure or meaningful occupation.', 'To foster initial engagement in group and leisure activities within the facility.', 'Resident will be invited to join in-house group recreational activities (e.g., art-based engagement or music) at least once per month, with gentle encouragement from staff.', 'Facilitated participation in low-demand, enjoyable activities can promote a sense of belonging and gradually build motivation and confidence.', 7),
(275, 26, 'Lack of insight and refusal to acknowledge mental health needs.', 'To increase awareness of mental health and the importance of treatment.', 'Resident will receive individualized psychoeducation sessions by interns once per month, focusing on illness awareness and medication benefits, for the next 3 months.', 'Targeted psychoeducation may gradually enhance insight, support engagement in care, and reduce resistance to treatment.', 8),
(344, 34, 'Ongoing management of psychiatric and physical health conditions with medication.', 'To maintain stable mental and physical health through consistent medication adherence.', 'Resident will take all prescribed psychiatric and physical health medications under direct supervision of nursing staff daily for the next 12 weeks.', 'Supervised medication administration ensures continuity of treatment, addresses risk of relapse, and promotes stabilization of both psychiatric and physical health conditions.', 1),
(345, 34, 'Significant difficulty with concentration, memory, and learning new tasks.', 'To enhance cognitive functioning for improved daily living and self-management.', 'Resident will participate in cognitive behavioral group therapy sessions three times per week, with staff facilitation, for the next 12 weeks.', 'Structured cognitive group therapy addresses deficits in attention, memory, and problem-solving, supporting greater independence in daily tasks', 0),
(346, 34, 'Moderate challenges with standing, moving around, and using public transport.', 'To improve physical mobility and safe independent movement within and outside the facility.', 'Resident will engage in a daily supervised physical activity program tailored by a physiotherapist, focusing on mobility and endurance, for the next 12 weeks.', 'Regular, structured physical activity supports improved mobility, reduces risk of falls, and builds confidence in navigating the environment.', 2),
(347, 34, 'High level of assistance needed for personal hygiene, dressing, and eating.', 'To increase independence in personal hygiene, dressing, and eating.', 'Resident will receive individualized self-care skills training from occupational therapy staff three times per week, including supervised practice in bathing, dressing, and eating, for the next 12 weeks.', 'Targeted skills training with frequent practice addresses severe self-care deficits, reduces health risks, and promotes dignity and autonomy.', 3),
(348, 34, 'Limited ability to perform household tasks and manage basic financial responsibilities.', 'To improve competence in household management and basic financial skills.', 'Resident will participate in weekly life skills group sessions focusing on household chores and basic money management for the next 12 weeks, with progress monitored by staff.', 'Life skills training enhances functional independence and prepares the resident for transition to more independent living settings.', 4),
(349, 34, 'Difficulty initiating and maintaining friendships and social engagement.', 'To strengthen social interaction skills and foster positive peer relationships.', 'Resident will attend at least one social skills group therapy session per week and participate in bi-weekly community or recreational events with staff encouragement for the next 12 weeks.', 'Regular participation in social skills groups and events provides opportunities to practice communication, build confidence, and reduce social isolation.', 5),
(350, 34, 'Low participation in community and recreational activities, impacting quality of life.', 'To increase involvement in meaningful community and leisure activities.', 'Resident will be supported to join at least two group recreational or community activities per month, with individualized planning and staff accompaniment as needed, for the next 12 weeks.', 'Facilitated participation broadens social networks, improves well-being, and supports recovery-oriented goals.', 6),
(351, 34, 'Hearing impairment affecting communication and engagement.', 'To optimize communication and engagement despite hearing impairment.', 'Resident will be provided with regular hearing assessments and access to assistive listening devices, with staff monitoring effectiveness and supporting communication during group sessions for the next 12 weeks.', 'Addressing hearing needs reduces communication barriers and promotes fuller participation in therapeutic and social activities.', 7),
(352, 34, 'Ongoing management of skin infections and monitoring for related complications.', 'To prevent and manage skin infections and related health complications.', 'Resident will receive weekly skin integrity checks and appropriate wound care from nursing staff, with prompt referral to medical services as needed, for the next 12 weeks.', 'Routine monitoring and early intervention prevent escalation of skin issues and support overall health.', 8),
(376, 37, 'Stabilization of mood symptoms and prevention of relapse in Bipolar Affective Disorder.', 'To achieve and maintain clinical stability of mood symptoms.', 'Resident will receive ongoing psychiatric evaluation and supervised medication administration by nursing staff daily, with psychiatrist review four times a week.', 'Regular medication monitoring and psychiatric input are essential for mood stabilization, reducing relapse risk, and enabling engagement in psychosocial interventions, consistent with best practices for bipolar disorder management.', 0),
(377, 37, 'Effective management of diabetes to prevent medical complications.', 'To maintain optimal glycemic control and prevent diabetes-related complications.', 'Resident will have daily blood glucose monitoring and supervised administration of antidiabetic medication by nursing staff, with regular basic medical checkups.', 'Integrated physical health management is crucial for residents with comorbid chronic illness, supporting overall functioning and aligning with the center’s capacity for daily medical care.', 2),
(378, 37, 'Impaired concentration, difficulty remembering tasks, and sustaining attention.', 'To improve concentration, memory, and cognitive functioning.', 'Resident will participate in weekly group sessions focused on brain exercises, memory games, and activity-based cognitive stimulation, with staff facilitation for 8 weeks.', 'Group-based cognitive remediation leverages available activity sessions, supporting neuroplasticity and executive functioning, and is tailored to the resident’s cognitive profile.', 1),
(379, 37, 'Difficulty standing for long periods and walking long distances, with associated physical fatigue.', 'To enhance physical endurance and mobility for daily functioning.', 'Resident will attend monthly physiotherapy assessments and participate in recommended mobility exercises under physiotherapist guidance, with daily encouragement by staff.', 'Physiotherapy improves mobility and reduces fatigue, addressing WHODAS mobility concerns and preventing physical deconditioning in psychiatric rehabilitation.', 3),
(380, 37, 'Difficulty completing household responsibilities and tasks promptly.', 'To improve ability to manage household activities and personal space.', 'Resident will engage in structured daily routines for tidying personal space, washing dishes, and basic household tasks with caregiver support and activity scheduling for 6 weeks.', 'Activity scheduling and caregiver-assisted routines foster independence and build habits, in line with behavioral activation and rehabilitation principles.', 4),
(381, 37, 'Severe impairment in work-related skills and lack of participation in vocational activities.', 'To develop basic vocational skills and increase engagement in meaningful work.', 'Resident will be introduced to handicrafts and tailoring sessions for female residents six days a week, with caregiver supervision and positive reinforcement through the token economy.', 'Vocational engagement addresses disability in life activities, leverages available gender-appropriate vocational programs, and uses behavioral strategies to increase motivation and participation.', 5),
(382, 37, 'Frequent conflict and difficulty sustaining friendships and positive interactions with peers and staff.', 'To improve social skills and reduce interpersonal conflict.', 'Resident will participate in weekly group therapy and psychoeducation sessions on social manners, emotional regulation, and communication skills, facilitated by staff and interns for 8 weeks.', 'CBT-informed group sessions and psychoeducation target core social skill deficits, emotional awareness, and conflict resolution, using the center’s structured group activity resources.', 6),
(383, 37, 'Limited participation in group activities and social engagement.', 'To increase participation in group-based and leisure activities.', 'Resident will be encouraged to join the weekly art-based engagement sessions or Kala Samiti, based on her interests, with staff prompting and support.', 'Strength-based, interest-driven engagement in creative group activities fosters social integration and leverages the resident’s potential strengths and available art collective resources.', 7),
(384, 37, 'Low involvement in community and recreational activities outside the facility.', 'To promote greater community participation and access to external leisure opportunities.', 'Resident will be nominated for recreational outings (e.g., movie trips) organized thrice a year, contingent on readiness and engagement in facility activities.', 'Community outings support social inclusion and broaden participation, using available organizational events as motivational incentives for engagement.', 8),
(385, 37, 'Emotional distress and frequent negative feelings related to mental health condition.', 'To enhance emotional well-being and coping with negative feelings.', 'Resident will receive monthly individual counselling sessions focused on emotional regulation and coping strategies, with additional sessions as needed upon staff referral.', 'Talk therapy delivered by counsellors or social workers supports emotional processing and resilience, addressing high psychological distress as indicated by WHOQoL scores.', 9),
(386, 37, 'Impaired understanding of roles of professionals and available services in her care.', 'To improve awareness of care processes and available support systems.', 'Resident will attend monthly psychoeducation sessions by interns focused on the role of healthcare staff, medication adherence, and rights and responsibilities.', 'Psychoeducation enhances insight, cooperation with treatment, and empowerment, aligning with available intern-led sessions for female residents.', 10);

-- --------------------------------------------------------

--
-- Table structure for table `care_plan_statuses`
--

CREATE TABLE `care_plan_statuses` (
  `id` int(11) NOT NULL,
  `care_plan_goal_id` int(11) NOT NULL,
  `goal_progress` enum('significant_progress','moderate_progress','some_progress','no_progress','regression') NOT NULL,
  `is_resident_related_barrier` tinyint(1) NOT NULL,
  `is_goal_related_barrier` tinyint(1) NOT NULL,
  `is_intervention_related_barrier` tinyint(1) NOT NULL,
  `is_external_barrier` tinyint(1) NOT NULL,
  `progress_comments` text NOT NULL,
  `intervention_adherence` enum('never','rarely','sometimes','often','always') NOT NULL,
  `is_resident_related_reason` tinyint(1) NOT NULL,
  `is_resource_related_reason` tinyint(1) NOT NULL,
  `is_logistical_reason` tinyint(1) NOT NULL,
  `is_other_reason` tinyint(1) NOT NULL,
  `adherence_comments` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `care_plan_statuses`
--

INSERT INTO `care_plan_statuses` (`id`, `care_plan_goal_id`, `goal_progress`, `is_resident_related_barrier`, `is_goal_related_barrier`, `is_intervention_related_barrier`, `is_external_barrier`, `progress_comments`, `intervention_adherence`, `is_resident_related_reason`, `is_resource_related_reason`, `is_logistical_reason`, `is_other_reason`, `adherence_comments`, `created_at`) VALUES
(47, 7, 'some_progress', 1, 0, 0, 0, 'nil', 'often', 0, 1, 0, 0, 'nil', '2025-08-02 03:20:50'),
(48, 6, 'significant_progress', 0, 1, 0, 0, 'nil', 'often', 0, 1, 0, 0, 'nil', '2025-08-02 03:20:50'),
(49, 8, 'moderate_progress', 0, 1, 0, 0, 'nil', 'often', 0, 1, 1, 0, 'nil', '2025-08-02 03:20:50'),
(50, 11, 'moderate_progress', 0, 1, 0, 0, 'nil', 'often', 0, 0, 1, 0, 'nil', '2025-08-02 03:20:50'),
(51, 9, 'no_progress', 0, 1, 0, 0, 'nil', 'often', 0, 1, 1, 0, 'nil', '2025-08-02 03:20:50'),
(52, 10, 'some_progress', 1, 1, 0, 0, 'nil', 'rarely', 0, 1, 1, 0, 'nil', '2025-08-02 03:20:50'),
(53, 12, 'moderate_progress', 0, 1, 0, 0, 'nil', 'often', 0, 0, 1, 0, 'nil', '2025-08-02 03:20:50'),
(127, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(128, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(129, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(130, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(131, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(132, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(133, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(134, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(135, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(136, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(137, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:12'),
(138, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(139, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(140, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(141, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(142, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(143, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(144, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(145, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(146, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(147, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(148, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:22:23'),
(149, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(150, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(151, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(152, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(153, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(154, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(155, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(156, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(157, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(158, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(159, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:27:48'),
(160, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(161, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(162, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(163, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(164, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(165, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(166, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(167, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(168, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(169, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(170, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:32:07'),
(171, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(172, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(173, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(174, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(175, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(176, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(177, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(178, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(179, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(180, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(181, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:33:47'),
(182, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(183, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(184, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08');
INSERT INTO `care_plan_statuses` (`id`, `care_plan_goal_id`, `goal_progress`, `is_resident_related_barrier`, `is_goal_related_barrier`, `is_intervention_related_barrier`, `is_external_barrier`, `progress_comments`, `intervention_adherence`, `is_resident_related_reason`, `is_resource_related_reason`, `is_logistical_reason`, `is_other_reason`, `adherence_comments`, `created_at`) VALUES
(185, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(186, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(187, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(188, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(189, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(190, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(191, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(192, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:08'),
(193, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(194, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(195, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(196, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(197, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(198, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(199, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(200, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(201, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(202, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(203, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-06 10:36:36'),
(204, 379, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(205, 382, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(206, 376, 'some_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(207, 380, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(208, 378, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(209, 377, 'significant_progress', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(210, 386, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 0, 0, 1, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(211, 384, 'moderate_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'often', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(212, 381, 'significant_progress', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(213, 385, 'moderate_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 1, 0, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02'),
(214, 383, 'significant_progress', 0, 0, 1, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', 'sometimes', 0, 1, 0, 0, 'What this Fix Does:\nEnsures all text in this section uses the same 10pt Helvetica Normal font like your other sections.\n\nKeeps severity headings bold for clarity, consistent with other sections like WHODAS.\n\nKeeps bullets aligned and consistent in spacing.\n\nLet me know if you want the entire SOFS section as a table instead, or if you want to remove bold headings', '2025-08-07 05:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

CREATE TABLE `institutions` (
  `id` int(11) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `location_district` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `sanctioned_bed_capacity` int(11) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institutions`
--

INSERT INTO `institutions` (`id`, `institution_name`, `address`, `location_district`, `pincode`, `sanctioned_bed_capacity`, `contact_person`, `phonenumber`, `created_at`, `updated_at`, `status`) VALUES
(14, 'organization', 'demo address', 'Wayanad', 642234, 10, 'Albin Joseph', '3344556677', '2025-06-26 12:04:02', '2025-07-15 04:58:34', 'active'),
(15, 'organization 2', 'demo', 'Wayanad', 642235, 100, 'Albin Joseph', '8877665544', '2025-06-26 16:10:20', '2025-07-15 04:58:11', 'active'),
(17, 'Mariyasadanam', ' Kizhathadiyoor Rd, P.O, Pala, Kerala ', 'Ernakulam', 686574, 300, 'Director', '9999999999', '2025-07-15 04:00:00', '2025-07-15 17:34:08', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `institution_resident_demographics`
--

CREATE TABLE `institution_resident_demographics` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `total_residents` int(11) NOT NULL,
  `gender_male_count` int(11) NOT NULL,
  `gender_female_count` int(11) NOT NULL,
  `gender_other_count` int(11) NOT NULL,
  `age_minor_count` int(11) NOT NULL,
  `age_18_40_count` int(11) NOT NULL,
  `age_41_65_count` int(11) NOT NULL,
  `age_over_65_count` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institution_resident_demographics`
--

INSERT INTO `institution_resident_demographics` (`id`, `institution_id`, `total_residents`, `gender_male_count`, `gender_female_count`, `gender_other_count`, `age_minor_count`, `age_18_40_count`, `age_41_65_count`, `age_over_65_count`, `updated_at`) VALUES
(1, 14, 11, 10, 1, 0, 10, 1, 0, 0, '2025-06-26 21:58:14'),
(2, 15, 10, 9, 1, 0, 10, 0, 0, 0, '2025-06-26 16:26:32'),
(3, 17, 369, 262, 107, 0, 0, 75, 257, 37, '2025-07-15 16:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `institution_resident_diagnoses`
--

CREATE TABLE `institution_resident_diagnoses` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `diagnosis_name` varchar(255) NOT NULL,
  `resident_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institution_resident_diagnoses`
--

INSERT INTO `institution_resident_diagnoses` (`id`, `institution_id`, `diagnosis_name`, `resident_count`) VALUES
(8, 14, 'Schizophrenia Spectrum Disorder', 11),
(9, 14, 'Bipolar Affective Disorder', 1),
(10, 14, 'Psychotic Disorder', 2),
(11, 14, 'Depressive Disorder', 3),
(12, 14, 'Substance Use Disorder', 6),
(13, 14, 'Other Mental Health Condition', 6),
(14, 14, 'Undiagnosed/Under Observation', 8),
(15, 15, 'Schizophrenia Spectrum Disorder', 5),
(20, 17, 'Schizophrenia Spectrum Disorder', 92),
(21, 17, 'Schizoaffective Disorder', 15),
(22, 17, 'Bipolar Affective Disorder', 57),
(23, 17, 'Psychotic Disorder', 4),
(24, 17, 'Other Mental Health Condition', 93),
(25, 17, 'Undiagnosed/Under Observation', 108);

-- --------------------------------------------------------

--
-- Table structure for table `institution_services`
--

CREATE TABLE `institution_services` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `staff_involved` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institution_services`
--

INSERT INTO `institution_services` (`id`, `institution_id`, `service_name`, `frequency`, `staff_involved`, `description`) VALUES
(5, 14, 'Group Therapy', '24/7', '[\"Counsellor\"]', ''),
(6, 17, 'Basic Medical Care', 'Daily', '[\"Social Worker\", \"Nurse\", \"Physician\", \"Caregivers/Attendants\", \"Lab technician\"]', 'Basic medical care includes primarily care for physical ailments, dressing, medication, bedridden residents. Medication is administered by the nurse in the presence of social worker or caregiver. There is a laboratory for carrying basic medical tests at the organisation.'),
(7, 17, 'Psychiatric Evaluation', 'Four times a week', '[\"Psychiatrist\"]', 'The psychiatrist diagnoses the resident, prescription of medication, monitor effectiveness of prescribed medications, improvement in symptomatology, identify needs and modifications in current treatment plan on the basis of their observations and counselling notes provided by the staff.'),
(8, 17, 'Counselling', 'Monthly', '[\"Counsellor\", \"Social Worker\", \"Psychologists\"]', 'Counselling is provided to neurotic residents on the basis of their needs and request. If there is are changes in symptoms or behaviour which needs attention, the resident is recommended for counselling by the staff. The senior counsellor is available once a month, who also conducts the mental status examination. When needed social worker may also take the counselling session. Counselling is largely limited to talk therapy.'),
(9, 17, 'Psychoeducation', 'Daily and Monthly', '[\"Social Worker\", \"Counsellor\", \"Intern\"]', 'Psychoeducation is provided daily for the male residents in group settings. The topics include hygiene, social manners, social interactions and medication adherence. For female residents, the psychoeducation sessions are conducted by interns. Apart from the mentioned topics, female residents are also given sessions on menstrual hygiene and care.'),
(10, 17, 'Crisis Intervention', '24/7', '[\"Physician\", \"Social Worker\", \"Nurse\", \"Caregivers/Attendants\", \"Psychiatrist\"]', 'Physicians and doctors are available on call in case of crisis situations. If any resident is aggressive or suicidal, they are consulted telephonically immediately to administer the required medication to calm the resident. As per doctor’s recommendation, the resident may also be put in isolation for a few hours until they are stable enough to be shifted to the wards.'),
(11, 17, 'Physiotherapy', 'Monthly', '[\"Physiotherapist\"]', 'During their monthly visits, the physiotherapist in the Palliative Care Unit from the nearby government hospital, conducts physiotherapy sessions for the residents who have the need for it. For those who require regular sessions, they are taken to external physiotherapists.'),
(12, 17, 'Group Sessions', 'Weekly', '[\"Social Worker\"]', 'Groups are created with the residents having the same gender and same diagnosis. These are activity-based sessions to engage the residents and make them use their cognitive and physical faculties. Activities include taking a walk outside, newspaper reading and discussions, sorting, brain exercises, memory and concentration enhancement games.'),
(13, 17, 'Vocational Training: Tailoring', 'Six days a week', '[\"Caregivers/Attendants\", \"Recovered residents\"]', 'The tailoring activities are conducted by a caregiver who supervises and guides the residents. Recovered residents who have stabilised psychopathology also assist with conducting tailoring sessions. Tailoring is usually assigned to the female residents who have previous experience or have expressed an interest. The resident also needs to be capable of operating machinery. In order to incentivize the residents to participate, personal requests for food and items made by the residents who work who are engaged in tailoring are granted on priority.'),
(14, 17, 'Vocational Training: Candle-making', 'Six days a week', '[\"Caregivers/Attendants\", \"Recovered residents\"]', 'Candle-making is supervised by a caregiver for the residents who have trained in candle making. This group is limited to four female residents and is not open for new participants at present.'),
(15, 17, 'Vocational Training: Animal Husbandry', 'Daily', '[\"Caregivers/Attendants\", \"Supervisor\"]', 'This vocational activity is open to male residents with stabilised. They are assigned the responsibility for the care of the domesticated animals at the organization. There is also fish farming and poultry. The residents are expected to feed, wash and take care of them.'),
(16, 17, 'Vocational Training: Farming/Gardening', 'Daily', '[\"Supervisor\"]', 'Male residents who have shown significant recovery in psychopathology and functioning are assigned to farming in the organisation premises.'),
(17, 17, 'Vocational Training: Cleaning/Maintenance', 'Daily', '[\"Caregivers/Attendants\", \"Supervisor\"]', 'Male residents who have shown significant recovery in psychopathology and functioning are assigned to cleaning duties and maintenance activities like plumbing. They are trained in using different cleaning products and equipment.'),
(18, 17, 'Vocational Training: Kitchen Duties', 'Daily', '[\"Supervisor\", \"Cook\"]', 'Male residents who have shown significant recovery in psychopathology and functioning are assigned to kitchen duties. They also need to be physically healthy and strong, with good self-care and hygiene. Kitchen duties are assigned after confirmation with the doctor.'),
(19, 17, 'Vocational Training: Handicrafts', 'Six days a week', '[\"Caregivers/Attendants\"]', 'Mats are produced as a handicraft item by the female residents. This involves sorting used clothes, weaving and stitching them in a particular way to create mats. The training for this activity is provided by an external trainer and the residents gain experience with time.'),
(20, 17, 'Art-based Engagement', 'As needed', '[\"Supervisor\"]', 'There is a Kala Samiti (Art Collective) which is formed by residents with creative talents like dancing, singing, drama. The group also includes staff members who support the activities. Plays, short films, teledramas are produced by this collective. The recording is carried out in the in-house studio.'),
(21, 17, 'Recreational Activities', 'Thrice a year', '[\"Caregivers/Attendants\"]', 'Residents are taken out for movies thrice a year. Preference is given to residents who are actively engaged in the activities at the organization.'),
(22, 17, 'Vocational activity: Paper-bag Making', 'Six days a week', '[\"Caregivers/Attendants\"]', 'Paper-bag making is open to residents who can grasp and follow instructions. This activity requires the resident to be quick and ready to carry out the work consistently. It is also supervised by a caregiver. If a resident express interest they are trained for a while to assess whether it is a suitable activity for them.'),
(23, 17, 'Vocational activity: Caregiving', 'Daily', '[\"Caregivers/Attendants\", \"Nurse\"]', 'Residents who have shown significant recovery in psychopathology and functioning, in good physical health are chosen for caregiving in the palliative unit of the organisation. They are trained by the nurses.');

-- --------------------------------------------------------

--
-- Table structure for table `institution_staff_composition`
--

CREATE TABLE `institution_staff_composition` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `staff_category` varchar(100) NOT NULL,
  `staff_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institution_staff_composition`
--

INSERT INTO `institution_staff_composition` (`id`, `institution_id`, `staff_category`, `staff_count`) VALUES
(16, 15, 'Permanent', 10),
(17, 15, 'Contractual/Temporary', 10),
(18, 15, 'Volunteers', 11),
(19, 15, 'Interns', 5),
(20, 15, 'Recovered residents', 8),
(31, 14, 'Permanent', 10),
(32, 14, 'Contractual/Temporary', 10),
(33, 14, 'Volunteers', 5),
(34, 14, 'Interns', 5),
(35, 14, 'Recovered residents', 6),
(41, 17, 'Permanent', 53),
(42, 17, 'Contractual/Temporary', 0),
(43, 17, 'Volunteers', 28),
(44, 17, 'Interns', 15),
(45, 17, 'Recovered residents', 110);

-- --------------------------------------------------------

--
-- Table structure for table `institution_staff_roles`
--

CREATE TABLE `institution_staff_roles` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_description` text DEFAULT NULL,
  `staff_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institution_staff_roles`
--

INSERT INTO `institution_staff_roles` (`id`, `institution_id`, `role_name`, `role_description`, `staff_count`) VALUES
(45, 15, 'Social Workers', NULL, 10),
(46, 15, 'Nurses', NULL, 3),
(59, 14, 'Social Workers', NULL, 10),
(60, 14, 'Counsellors', NULL, 10),
(61, 14, 'Nurses', NULL, 5),
(62, 14, 'Psychiatrists', NULL, 4),
(63, 14, 'Physicians', NULL, 6),
(64, 14, 'Psychologists', NULL, 8),
(65, 14, 'Vocational Trainers', NULL, 3),
(66, 14, 'Caregivers/Attendants', NULL, 6),
(67, 14, 'Housekeeping/Maintenance Staff', NULL, 8),
(68, 14, 'Cooks/Kitchen Staff', NULL, 8),
(69, 14, 'Other', 'Art Therapist', 2),
(92, 17, 'Social Workers', NULL, 10),
(93, 17, 'Nurses', NULL, 7),
(94, 17, 'Psychiatrists', NULL, 2),
(95, 17, 'Physicians', NULL, 2),
(96, 17, 'Psychologists', NULL, 1),
(97, 17, 'Vocational Trainers', NULL, 1),
(98, 17, 'Caregivers/Attendants', NULL, 25),
(99, 17, 'Housekeeping/Maintenance Staff', NULL, 1),
(100, 17, 'Cooks/Kitchen Staff', NULL, 2),
(101, 17, 'Other', 'Lab Techinician', 1),
(102, 17, 'Other', 'Supervisor', 2);

-- --------------------------------------------------------

--
-- Table structure for table `institution_visiting_staff`
--

CREATE TABLE `institution_visiting_staff` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `staff_count` int(11) NOT NULL,
  `visit_frequency` enum('WEEKLY','BIWEEKLY','MONTHLY','ON_CALL') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institution_visiting_staff`
--

INSERT INTO `institution_visiting_staff` (`id`, `institution_id`, `role_name`, `staff_count`, `visit_frequency`) VALUES
(3, 15, 'Psychiatrists', 10, 'WEEKLY'),
(4, 14, 'Psychiatrists', 10, 'WEEKLY'),
(5, 14, 'Psychologists', 10, 'MONTHLY'),
(6, 14, 'art teacher', 2, 'WEEKLY'),
(11, 17, 'Psychologists', 1, 'MONTHLY'),
(12, 17, 'Physicians', 1, 'MONTHLY'),
(13, 17, 'Physiotherpaist', 1, 'MONTHLY'),
(14, 17, 'Dermatologist', 1, 'MONTHLY'),
(15, 17, 'Gynaecologist', 1, 'MONTHLY');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `otp_code` varchar(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `marital_status` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `date_of_admission` date NOT NULL,
  `source_of_admission` varchar(100) DEFAULT NULL,
  `duration_of_homelessness_years` int(11) DEFAULT NULL,
  `duration_of_homelessness_months` int(11) DEFAULT NULL,
  `is_new_admission` tinyint(1) DEFAULT NULL,
  `has_rehabilitation_history` enum('Yes','No','Unknown') DEFAULT NULL,
  `rehabilitation_history` text DEFAULT NULL,
  `legal_compliances` text DEFAULT NULL,
  `legal_compliances_notes` text DEFAULT NULL,
  `emergency_care_provided` text DEFAULT NULL,
  `languages_known` text DEFAULT NULL,
  `work_status` text DEFAULT NULL,
  `occupation` text DEFAULT NULL,
  `family_contact_available` enum('Yes','No','Unknown') DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `contact_person_relationship` text DEFAULT NULL,
  `last_family_contact_date` date DEFAULT NULL,
  `is_family_involved_in_care` tinyint(1) DEFAULT NULL,
  `family_notes` text DEFAULT NULL,
  `legal_information` text DEFAULT NULL,
  `strengths` text DEFAULT NULL,
  `aspirations` text DEFAULT NULL,
  `goals_notes` text DEFAULT NULL,
  `readiness_for_change` varchar(100) DEFAULT NULL,
  `current_provisional_diagnosis` varchar(255) DEFAULT NULL,
  `medications` text DEFAULT NULL,
  `estimated_duration_of_illness` enum('Less than 2 years','2-5 years','6-10 years','More than 10 years') DEFAULT NULL,
  `known_comorbidities` text DEFAULT NULL,
  `other_comorbidities` text DEFAULT NULL,
  `is_under_medication_physical_health` tinyint(1) DEFAULT NULL,
  `is_under_medication_psychiatric` tinyint(1) DEFAULT NULL,
  `has_medication_adherence_issues` tinyint(1) DEFAULT NULL,
  `medication_adherence_reason` text DEFAULT NULL,
  `status` enum('Resident','Discharged','Expired') DEFAULT NULL,
  `status_notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `institution_id`, `staff_id`, `name`, `age`, `gender`, `marital_status`, `religion`, `date_of_admission`, `source_of_admission`, `duration_of_homelessness_years`, `duration_of_homelessness_months`, `is_new_admission`, `has_rehabilitation_history`, `rehabilitation_history`, `legal_compliances`, `legal_compliances_notes`, `emergency_care_provided`, `languages_known`, `work_status`, `occupation`, `family_contact_available`, `contact_person_name`, `contact_person_relationship`, `last_family_contact_date`, `is_family_involved_in_care`, `family_notes`, `legal_information`, `strengths`, `aspirations`, `goals_notes`, `readiness_for_change`, `current_provisional_diagnosis`, `medications`, `estimated_duration_of_illness`, `known_comorbidities`, `other_comorbidities`, `is_under_medication_physical_health`, `is_under_medication_psychiatric`, `has_medication_adherence_issues`, `medication_adherence_reason`, `status`, `status_notes`, `created_at`, `updated_at`) VALUES
(1, 14, 1, 'Resident 1', 22, 'Male', 'Single', 'Christian', '2025-07-06', 'Police', 1, 2, 1, 'Yes', '[{\"previous_centre_name\": \"Center for all\", \"previous_stay_start_date\": \"2025-01-01\", \"previous_stay_end_date\": \"2025-06-01\", \"reason_for_previous_admission\": \"nil\"}]', 'Police Memo,Letter from Ward member/Panchayat President', '', 'Oral hygiene,Change of clothes,Cleaning,Haircut,Nails,Bathing', 'English,Tamil,Malayalam', 'Paid work,Student,Homemaker', '', 'Yes', 'jhon', 'Sibling', '2025-06-05', 1, 'he thinks he can change', '', 'Compliant with medication and treatment,Creative,Physically active', 'Return to family/home,Learn a new skill/vocation,Live independently,Manage symptoms better', '', 'Slightly willing', 'Psychotic Disorder', '[{\"name\":\"anti depressants\",\"dosage\":\"weekly\",\"date_started\":\"2025-07-01\"}]', 'Less than 2 years', 'Diabetes,Hypertension,Skin Infections,Hearing Impairment', '', 1, 1, 0, '', 'Resident', '', '2025-07-06 10:01:10', '2025-08-02 13:35:03'),
(2, 14, 1, 'Resident 2', 22, 'Female', 'Single', 'Christian', '2025-07-06', 'Community Referral', 1, 2, 1, 'No', NULL, 'Police Memo,Clinical records', '', 'Oral hygiene,Change of clothes,Cleaning', 'English,Malayalam,Tamil', 'Paid work,Student', '', 'No', '', '', NULL, 0, '', '', 'Compliant with medication and treatment,Specific vocational skill', 'Find employment,Manage symptoms better', '', 'Very willing', 'Schizophrenia Spectrum Disorder', '[]', 'Less than 2 years', 'Diabetes,Skin Infections,Allergies', '', 1, 1, 0, '', 'Resident', '', '2025-07-06 10:25:57', '2025-07-06 10:25:57'),
(3, 17, 3, 'DR', 35, 'Female', 'Married', 'Hindu', '2025-04-15', 'Family', NULL, 7, 0, 'Yes', '[{\"previous_centre_name\": \"IHMS\", \"previous_stay_start_date\": \"2022-03-01\", \"previous_stay_end_date\": \"2022-06-20\", \"reason_for_previous_admission\": \"She was admitted to the hospital when she started exhibiting symptoms of delusion, excitement and suicidal behaviour. She was discharged after four months and returned to stay with her husband.\"}, {\"previous_centre_name\": \"ECRC\", \"previous_stay_start_date\": \"2023-12-10\", \"previous_stay_end_date\": \"2024-04-30\", \"reason_for_previous_admission\": \"The resident stopped taking medication for a few months and left home saying that she did not want to stay with her husband anymore. She was missing for two weeks and was later found in a city near her maternal home. She was admitted to ECRC and was discharged after five months, after her condition had stabilised.\"}]', 'Affidavit from family/bystander,Letter from Ward member/Panchayat President,Letter of recommendation from a social organization or church in the community,Clinical records', '', 'Bloodwork,Personal kit provided,Change of clothes', 'English,Kannada,Malayalam', 'Homemaker', 'The resident used to work as a typing assistant after she had completed a diploma. She had the job until she was married at the age of thirty-two. After that she became a homemaker.', 'Yes', 'RK', 'Spouse', '2025-06-13', 0, 'The resident\'s marital relationship is fraught with inconsistencies in her reports, indicating potential abuse or miscommunication. Her family includes her parents, two older sisters, and a brother-in-law with mental health issues. She is reluctant to discuss her family in depth. Her opinions and information about her husband change during every conversation. At times, she says her husband loves her a lot and at other times, she says he hits her and taunts her for her physique. The husband is not ready to be directly involved, but he calls her frequently. He does not visit very often.', 'No legal concerns in record.', 'Basic literacy / Numeracy,Insight about illness present', 'Return to family/home,Find employment', 'The resident has completed her school education and has a diploma in computer education. She has expressed her desire in learning new skills but does not actively respond to opportunities to do so. She feels lethargic and does not mingle well with other residents. There is some insight about her illness, primarily her physical health and is ready to take medications. But her history of medication non-adherence means that she does not understand the nature of her illness. ', 'Slightly willing', 'Bipolar Affective Disorder', NULL, '2-5 years', 'Diabetes', '', 1, 1, 1, 'Non-adherence to medication has led to relapses and institutionalizations. She gradually stopped taking her medicines prior to the recent relapse.', 'Resident', '', '2025-07-15 05:57:40', '2025-08-04 10:33:02'),
(4, 17, 3, 'Maria', 27, 'Female', 'Unknown', 'Christian', '2025-07-02', 'Community Referral', 0, 3, 1, 'Unknown', NULL, 'Police Memo,Incident report,Certification from psychiatrist', '', 'Oral hygiene,Change of clothes,Wound dressing,Personal kit provided,Cleaning,Haircut,Bathing,Nails,Bloodwork,Lice/Maggots/Skin lesions treated', 'English,Malayalam', 'Unknown', '', 'No', '', '', NULL, 0, '', 'The resident was admitted to the organisation after the local community members reported her for hostile behaviour.', 'Basic literacy / Numeracy', 'Return to family/home', ' Currently, the resident\'s severe hostility, prominent delusions, and profound lack of insight significantly impede the identification of additional strengths or the ability to engage her in goal-oriented activities. Reintegration with family is not possible at present as the family members cannot be traced. ', 'Not at all willing', 'Psychotic Disorder', '[{\"name\":\"Haloperidol\",\"dosage\":\"5mg\",\"date_started\":\"2025-07-02\"}]', 'Less than 2 years', 'Anaemia', 'According to lab results, the resident is slightly anaemic and underweight for her age.', 0, 1, 1, 'Initial resistance to medication required forceful administration; ongoing hostility and lack of insight suggest continued non-adherence if not closely monitored.', 'Resident', '', '2025-07-16 09:57:54', '2025-07-16 09:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `patient_assessments`
--

CREATE TABLE `patient_assessments` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `assessed_by_staff_id` int(11) NOT NULL,
  `assessment_date` date NOT NULL,
  `status` enum('in-progress','completed','cancelled') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_assessments`
--

INSERT INTO `patient_assessments` (`id`, `patient_id`, `assessment_id`, `assessed_by_staff_id`, `assessment_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-07-14', 'completed', '2025-07-14 14:24:35', '2025-07-14 14:27:47'),
(2, 1, 1, 1, '2025-07-14', 'completed', '2025-07-14 17:26:56', '2025-07-14 17:31:16'),
(3, 3, 1, 3, '2025-07-15', 'completed', '2025-07-15 06:06:33', '2025-07-15 06:25:11'),
(4, 4, 1, 3, '2025-07-16', 'completed', '2025-07-16 09:58:07', '2025-07-16 10:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `patient_assessment_responses`
--

CREATE TABLE `patient_assessment_responses` (
  `id` int(11) NOT NULL,
  `patient_assessment_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `response_value` varchar(255) NOT NULL,
  `na_reason` text DEFAULT NULL,
  `selected_checklist_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_assessment_responses`
--

INSERT INTO `patient_assessment_responses` (`id`, `patient_assessment_id`, `question_id`, `response_value`, `na_reason`, `selected_checklist_options`, `created_at`) VALUES
(1, 1, 1, '2', NULL, '[]', '2025-07-14 14:24:55'),
(2, 1, 2, '2', NULL, '[]', '2025-07-14 14:24:55'),
(3, 1, 3, '5', NULL, '[]', '2025-07-14 14:24:55'),
(4, 1, 4, '4', NULL, '[]', '2025-07-14 14:24:55'),
(5, 1, 5, '2', NULL, '[]', '2025-07-14 14:24:55'),
(6, 1, 6, '3', NULL, '[]', '2025-07-14 14:25:23'),
(7, 1, 7, '5', NULL, '[]', '2025-07-14 14:25:23'),
(8, 1, 8, '5', NULL, '[]', '2025-07-14 14:25:23'),
(9, 1, 9, '2', NULL, '[]', '2025-07-14 14:25:23'),
(10, 1, 10, '2', NULL, '[]', '2025-07-14 14:25:23'),
(11, 1, 11, '3', NULL, '[]', '2025-07-14 14:25:32'),
(12, 1, 12, '5', NULL, '[]', '2025-07-14 14:25:32'),
(13, 1, 13, '5', NULL, '[]', '2025-07-14 14:25:32'),
(14, 1, 14, '4', NULL, '[]', '2025-07-14 14:25:32'),
(15, 1, 15, '2', NULL, '[]', '2025-07-14 14:25:32'),
(16, 1, 16, '3', NULL, '[]', '2025-07-14 14:25:41'),
(17, 1, 17, '4', NULL, '[]', '2025-07-14 14:25:41'),
(18, 1, 18, '4', NULL, '[]', '2025-07-14 14:25:41'),
(19, 1, 19, '5', NULL, '[]', '2025-07-14 14:25:41'),
(20, 1, 20, '2', NULL, '[]', '2025-07-14 14:25:41'),
(21, 1, 21, '3', NULL, '[]', '2025-07-14 14:25:51'),
(22, 1, 22, '1', NULL, '[]', '2025-07-14 14:25:51'),
(23, 1, 23, '3', NULL, '[]', '2025-07-14 14:25:51'),
(24, 1, 24, '3', NULL, '[]', '2025-07-14 14:25:51'),
(25, 1, 25, '3', NULL, '[]', '2025-07-14 14:25:51'),
(26, 1, 26, 'false', NULL, '[]', '2025-07-14 14:26:02'),
(27, 1, 34, '2', NULL, '[]', '2025-07-14 14:26:02'),
(28, 1, 35, '1', NULL, '[]', '2025-07-14 14:26:02'),
(29, 1, 36, '5', NULL, '[]', '2025-07-14 14:26:02'),
(30, 1, 37, '3', NULL, '[]', '2025-07-14 14:26:02'),
(31, 1, 38, '5', NULL, '[]', '2025-07-14 14:26:10'),
(32, 1, 39, '1', NULL, '[]', '2025-07-14 14:26:10'),
(33, 1, 40, '3', NULL, '[]', '2025-07-14 14:26:10'),
(34, 1, 41, '4', NULL, '[]', '2025-07-14 14:26:10'),
(35, 1, 42, '4', NULL, '[]', '2025-07-14 14:26:10'),
(36, 1, 43, '6', NULL, '[]', '2025-07-14 14:26:25'),
(37, 1, 44, '3', NULL, '[]', '2025-07-14 14:26:25'),
(38, 1, 45, '4', NULL, '[\"Nail care\"]', '2025-07-14 14:26:25'),
(39, 1, 46, '2', NULL, '[\"Completing laundry\", \"Appropriate choice of clothing according to weather/occasion\"]', '2025-07-14 14:26:25'),
(40, 1, 47, '2', NULL, '[\"Identifying hunger\", \"Attending scheduled meals in the dining area\"]', '2025-07-14 14:26:25'),
(41, 1, 48, '4', NULL, '[\"Organizing personal belongings\", \"Sweeping and mopping the floor\"]', '2025-07-14 14:26:40'),
(42, 1, 49, '2', NULL, '[\"Appropriate use of tone and volume\", \"Staying on topic\"]', '2025-07-14 14:26:40'),
(43, 1, 50, '5', NULL, '[\"Managing emotions in social setting\", \"Appropriate and polite greetings\"]', '2025-07-14 14:26:40'),
(44, 1, 51, '1', NULL, '[]', '2025-07-14 14:26:40'),
(45, 1, 52, '2', NULL, '[\"Understanding value of money\", \"Identifying currency denominations\"]', '2025-07-14 14:26:40'),
(46, 1, 53, '5', NULL, '[\"Understanding and following directions for simple routes\", \"Moving independently without support\"]', '2025-07-14 14:26:54'),
(47, 1, 54, '1', NULL, '[]', '2025-07-14 14:26:54'),
(48, 1, 55, '5', NULL, '[\"Engaging in active leisure activities\", \"Using free time for leisure or preferred activity\"]', '2025-07-14 14:26:54'),
(49, 1, 56, '5', NULL, '[\"Travelling to place of employment/study\"]', '2025-07-14 14:26:54'),
(50, 1, 57, '5', NULL, '[\"Asking permission before borrowing or using items belonging to others or the organization\"]', '2025-07-14 14:26:54'),
(51, 1, 58, '2', NULL, '[\"Taking responsibility for minor mistakes or actions\", \"Managing personal hygiene and self-care routines\"]', '2025-07-14 14:27:06'),
(52, 1, 59, '1', NULL, '[]', '2025-07-14 14:27:06'),
(53, 1, 60, '4', NULL, '[]', '2025-07-14 14:27:06'),
(54, 1, 61, '1', NULL, '[]', '2025-07-14 14:27:06'),
(55, 1, 62, '2', NULL, '[]', '2025-07-14 14:27:06'),
(56, 1, 63, '5', NULL, '[]', '2025-07-14 14:27:14'),
(57, 1, 64, '1', NULL, '[]', '2025-07-14 14:27:14'),
(58, 1, 65, '2', NULL, '[]', '2025-07-14 14:27:14'),
(59, 1, 66, '2', NULL, '[]', '2025-07-14 14:27:14'),
(60, 1, 67, '1', NULL, '[]', '2025-07-14 14:27:14'),
(61, 1, 68, '5', NULL, '[]', '2025-07-14 14:27:21'),
(62, 1, 69, '5', NULL, '[]', '2025-07-14 14:27:21'),
(63, 1, 70, '2', NULL, '[]', '2025-07-14 14:27:21'),
(64, 1, 71, '1', NULL, '[]', '2025-07-14 14:27:21'),
(65, 1, 72, '2', NULL, '[]', '2025-07-14 14:27:21'),
(66, 1, 73, '3', NULL, '[]', '2025-07-14 14:27:30'),
(67, 1, 74, '2', NULL, '[]', '2025-07-14 14:27:30'),
(68, 1, 75, '1', NULL, '[]', '2025-07-14 14:27:30'),
(69, 1, 76, '3', NULL, '[]', '2025-07-14 14:27:30'),
(70, 1, 77, '1', NULL, '[]', '2025-07-14 14:27:30'),
(71, 1, 78, '3', NULL, '[]', '2025-07-14 14:27:39'),
(72, 1, 79, '4', NULL, '[]', '2025-07-14 14:27:39'),
(73, 1, 80, '5', NULL, '[]', '2025-07-14 14:27:39'),
(74, 1, 81, '2', NULL, '[]', '2025-07-14 14:27:39'),
(75, 1, 82, '2', NULL, '[]', '2025-07-14 14:27:39'),
(76, 1, 83, '2', NULL, '[]', '2025-07-14 14:27:44'),
(77, 1, 84, '5', NULL, '[]', '2025-07-14 14:27:44'),
(78, 2, 1, '5', NULL, '[]', '2025-07-14 17:28:47'),
(79, 2, 2, '5', NULL, '[]', '2025-07-14 17:28:47'),
(80, 2, 3, '4', NULL, '[]', '2025-07-14 17:28:47'),
(81, 2, 4, '5', NULL, '[]', '2025-07-14 17:28:47'),
(82, 2, 5, '2', NULL, '[]', '2025-07-14 17:28:47'),
(83, 2, 6, '2', NULL, '[]', '2025-07-14 17:28:57'),
(84, 2, 7, '1', NULL, '[]', '2025-07-14 17:28:57'),
(85, 2, 8, '5', NULL, '[]', '2025-07-14 17:28:57'),
(86, 2, 9, '3', NULL, '[]', '2025-07-14 17:28:57'),
(87, 2, 10, '3', NULL, '[]', '2025-07-14 17:28:57'),
(88, 2, 11, '4', NULL, '[]', '2025-07-14 17:29:04'),
(89, 2, 12, '5', NULL, '[]', '2025-07-14 17:29:04'),
(90, 2, 13, '5', NULL, '[]', '2025-07-14 17:29:04'),
(91, 2, 14, '5', NULL, '[]', '2025-07-14 17:29:04'),
(92, 2, 15, '1', NULL, '[]', '2025-07-14 17:29:04'),
(93, 2, 16, '5', NULL, '[]', '2025-07-14 17:29:11'),
(94, 2, 17, '4', NULL, '[]', '2025-07-14 17:29:11'),
(95, 2, 18, '5', NULL, '[]', '2025-07-14 17:29:11'),
(96, 2, 19, '2', NULL, '[]', '2025-07-14 17:29:11'),
(97, 2, 20, '1', NULL, '[]', '2025-07-14 17:29:11'),
(98, 2, 21, '3', NULL, '[]', '2025-07-14 17:29:21'),
(99, 2, 22, '5', NULL, '[]', '2025-07-14 17:29:21'),
(100, 2, 23, '2', NULL, '[]', '2025-07-14 17:29:21'),
(101, 2, 24, '2', NULL, '[]', '2025-07-14 17:29:21'),
(102, 2, 25, '3', NULL, '[]', '2025-07-14 17:29:21'),
(103, 2, 26, 'false', NULL, '[]', '2025-07-14 17:29:32'),
(104, 2, 34, '5', NULL, '[]', '2025-07-14 17:29:32'),
(105, 2, 35, '5', NULL, '[]', '2025-07-14 17:29:32'),
(106, 2, 36, '2', NULL, '[]', '2025-07-14 17:29:32'),
(107, 2, 37, '5', NULL, '[]', '2025-07-14 17:29:32'),
(108, 2, 38, '2', NULL, '[]', '2025-07-14 17:29:40'),
(109, 2, 39, '1', NULL, '[]', '2025-07-14 17:29:40'),
(110, 2, 40, '2', NULL, '[]', '2025-07-14 17:29:40'),
(111, 2, 41, '5', NULL, '[]', '2025-07-14 17:29:40'),
(112, 2, 42, '3', NULL, '[]', '2025-07-14 17:29:40'),
(113, 2, 43, '3', NULL, '[]', '2025-07-14 17:29:53'),
(114, 2, 44, '2', NULL, '[]', '2025-07-14 17:29:53'),
(115, 2, 45, '4', NULL, '[\"Nail care\"]', '2025-07-14 17:29:53'),
(116, 2, 46, '2', NULL, '[\"Notifying staff if clothing needs repair or replacement\"]', '2025-07-14 17:29:53'),
(117, 2, 47, '2', NULL, '[\"Following dietary restrictions\"]', '2025-07-14 17:29:53'),
(118, 2, 48, '2', NULL, '[\"Washing own dishes\"]', '2025-07-14 17:30:07'),
(119, 2, 49, '2', NULL, '[\"Expressing needs and preferences to staff\"]', '2025-07-14 17:30:07'),
(120, 2, 50, '2', NULL, '[\"Following time and schedule for activities\"]', '2025-07-14 17:30:07'),
(121, 2, 51, '5', NULL, '[\"Interest in forming new connections\"]', '2025-07-14 17:30:07'),
(122, 2, 52, '3', NULL, '[\"Understanding basic financial concepts\", \"Manages personal allowance\"]', '2025-07-14 17:30:07'),
(123, 2, 53, '5', NULL, '[\"Ability to use public transport\"]', '2025-07-14 17:30:22'),
(124, 2, 54, '2', NULL, '[\"Understanding roles of professionals involved in their care\", \"Using facility phone to make personal calls\"]', '2025-07-14 17:30:22'),
(125, 2, 55, '5', NULL, '[\"Using free time for leisure or preferred activity\", \"Engaging in active leisure activities\"]', '2025-07-14 17:30:22'),
(126, 2, 56, '3', NULL, '[\"Attending vocational rehabilitation groups or programs\", \"Travelling to place of employment/study\"]', '2025-07-14 17:30:22'),
(127, 2, 57, '3', NULL, '[\"Asking permission before borrowing or using items belonging to others or the organization\"]', '2025-07-14 17:30:22'),
(128, 2, 58, '2', NULL, '[\"Taking responsibility for minor mistakes or actions\", \"Managing personal hygiene and self-care routines\"]', '2025-07-14 17:30:33'),
(129, 2, 59, '2', NULL, '[]', '2025-07-14 17:30:33'),
(130, 2, 60, '2', NULL, '[]', '2025-07-14 17:30:33'),
(131, 2, 61, '5', NULL, '[]', '2025-07-14 17:30:33'),
(132, 2, 62, '3', NULL, '[]', '2025-07-14 17:30:33'),
(133, 2, 63, '2', NULL, '[]', '2025-07-14 17:30:43'),
(134, 2, 64, '2', NULL, '[]', '2025-07-14 17:30:43'),
(135, 2, 65, '2', NULL, '[]', '2025-07-14 17:30:43'),
(136, 2, 66, '2', NULL, '[]', '2025-07-14 17:30:43'),
(137, 2, 67, '2', NULL, '[]', '2025-07-14 17:30:43'),
(138, 2, 68, '2', NULL, '[]', '2025-07-14 17:30:53'),
(139, 2, 69, '2', NULL, '[]', '2025-07-14 17:30:53'),
(140, 2, 70, '2', NULL, '[]', '2025-07-14 17:30:53'),
(141, 2, 71, '2', NULL, '[]', '2025-07-14 17:30:53'),
(142, 2, 72, '2', NULL, '[]', '2025-07-14 17:30:53'),
(143, 2, 73, '5', NULL, '[]', '2025-07-14 17:31:01'),
(144, 2, 74, '2', NULL, '[]', '2025-07-14 17:31:01'),
(145, 2, 75, '2', NULL, '[]', '2025-07-14 17:31:01'),
(146, 2, 76, '3', NULL, '[]', '2025-07-14 17:31:01'),
(147, 2, 77, '2', NULL, '[]', '2025-07-14 17:31:01'),
(148, 2, 78, '2', NULL, '[]', '2025-07-14 17:31:09'),
(149, 2, 79, '2', NULL, '[]', '2025-07-14 17:31:09'),
(150, 2, 80, '2', NULL, '[]', '2025-07-14 17:31:09'),
(151, 2, 81, '2', NULL, '[]', '2025-07-14 17:31:09'),
(152, 2, 82, '2', NULL, '[]', '2025-07-14 17:31:09'),
(153, 2, 83, '2', NULL, '[]', '2025-07-14 17:31:15'),
(154, 2, 84, '2', NULL, '[]', '2025-07-14 17:31:15'),
(155, 3, 1, '3', NULL, '[]', '2025-07-15 06:07:29'),
(156, 3, 2, '3', NULL, '[]', '2025-07-15 06:07:29'),
(157, 3, 3, '2', NULL, '[]', '2025-07-15 06:07:29'),
(158, 3, 4, '2', NULL, '[]', '2025-07-15 06:07:29'),
(159, 3, 5, '2', NULL, '[]', '2025-07-15 06:07:29'),
(160, 3, 6, '3', NULL, '[]', '2025-07-15 06:08:09'),
(161, 3, 7, '4', NULL, '[]', '2025-07-15 06:08:09'),
(162, 3, 8, '1', NULL, '[]', '2025-07-15 06:08:09'),
(163, 3, 9, '1', NULL, '[]', '2025-07-15 06:08:09'),
(164, 3, 10, '1', NULL, '[]', '2025-07-15 06:08:09'),
(165, 3, 11, '2', NULL, '[]', '2025-07-15 06:09:38'),
(166, 3, 12, '1', NULL, '[]', '2025-07-15 06:09:38'),
(167, 3, 13, '1', NULL, '[]', '2025-07-15 06:09:38'),
(168, 3, 14, '1', NULL, '[]', '2025-07-15 06:09:38'),
(169, 3, 15, 'N/A', 'The resident has been in the organization for the past few months. There was no opportunity for her to be alone.', '[]', '2025-07-15 06:09:38'),
(170, 3, 16, '2', NULL, '[]', '2025-07-15 06:10:49'),
(171, 3, 17, '4', NULL, '[]', '2025-07-15 06:10:49'),
(172, 3, 18, '4', NULL, '[]', '2025-07-15 06:10:49'),
(173, 3, 19, '3', NULL, '[]', '2025-07-15 06:10:49'),
(174, 3, 20, 'N/A', 'The resident does not have the opportunity to engage in sexual activities. No observations related to this have been made yet.', '[]', '2025-07-15 06:10:49'),
(175, 3, 21, '3', NULL, '[]', '2025-07-15 06:11:27'),
(176, 3, 22, '3', NULL, '[]', '2025-07-15 06:11:27'),
(177, 3, 23, '4', NULL, '[]', '2025-07-15 06:11:27'),
(178, 3, 24, '4', NULL, '[]', '2025-07-15 06:11:27'),
(179, 3, 25, '12', NULL, '[]', '2025-07-15 06:11:27'),
(180, 3, 26, 'false', NULL, '[]', '2025-07-15 06:15:26'),
(181, 3, 34, '3', NULL, '[]', '2025-07-15 06:15:26'),
(182, 3, 35, '1', NULL, '[]', '2025-07-15 06:15:26'),
(183, 3, 36, '2', NULL, '[]', '2025-07-15 06:15:26'),
(184, 3, 37, '2', NULL, '[]', '2025-07-15 06:15:26'),
(185, 3, 38, '4', NULL, '[]', '2025-07-15 06:16:43'),
(186, 3, 39, '2', NULL, '[]', '2025-07-15 06:16:43'),
(187, 3, 40, 'N/A', 'The resident has not been with her family. There is no contact with anyone except her husband, who calls her occasionally.', '[]', '2025-07-15 06:16:43'),
(188, 3, 41, '2', NULL, '[]', '2025-07-15 06:16:43'),
(189, 3, 42, '18', NULL, '[]', '2025-07-15 06:16:43'),
(190, 3, 43, '20', NULL, '[]', '2025-07-15 06:17:33'),
(191, 3, 44, '20', NULL, '[]', '2025-07-15 06:17:33'),
(192, 3, 45, '1', NULL, '[]', '2025-07-15 06:17:33'),
(193, 3, 46, '1', NULL, '[]', '2025-07-15 06:17:33'),
(194, 3, 47, '1', NULL, '[]', '2025-07-15 06:17:33'),
(195, 3, 48, '3', NULL, '[\"Keeping personal space tidy\", \"Washing own dishes\", \"Organizing personal belongings\", \"Sweeping and mopping the floor\"]', '2025-07-15 06:19:01'),
(196, 3, 49, '3', NULL, '[\"Staying on topic\", \"Appropriate use of tone and volume\", \"Understanding verbal cues\", \"Initiating conversations with staff and residents\"]', '2025-07-15 06:19:01'),
(197, 3, 50, '3', NULL, '[\"Managing emotions in social setting\", \"Following time and schedule for activities\", \"Respecting personal space\", \"Recognizing other\\u2019s feelings and responding appropriately\"]', '2025-07-15 06:19:01'),
(198, 3, 51, '3', NULL, '[\"Interactions with residents and staff\", \"Participating in group activities\", \"Offering support to fellow residents\", \"Resolving conflicts with residents and staff\"]', '2025-07-15 06:19:01'),
(199, 3, 52, '1', NULL, '[]', '2025-07-15 06:19:01'),
(200, 3, 53, '2', NULL, '[\"Awareness of current location and time\"]', '2025-07-15 06:20:48'),
(201, 3, 54, '3', NULL, '[\"Understanding roles of professionals involved in their care\"]', '2025-07-15 06:20:48'),
(202, 3, 55, '2', NULL, '[\"Using free time for leisure or preferred activity\", \"Engaging in active leisure activities\"]', '2025-07-15 06:20:48'),
(203, 3, 56, '4', NULL, '[\"Participating in assigned facility duties or chores consistently\", \"Attending vocational rehabilitation groups or programs\", \"Completing tasks or activities assigned\"]', '2025-07-15 06:20:48'),
(204, 3, 57, '3', NULL, '[\"Returning borrowed items promptly\", \"Asking permission before borrowing or using items belonging to others or the organization\", \"Taking care of common belongings\"]', '2025-07-15 06:20:48'),
(205, 3, 58, '2', NULL, '[\"Adhering to rules and guidelines\", \"Participating in managing own medication\", \"Taking responsibility for minor mistakes or actions\"]', '2025-07-15 06:21:57'),
(206, 3, 59, '2', NULL, '[]', '2025-07-15 06:21:57'),
(207, 3, 60, '2', NULL, '[]', '2025-07-15 06:21:57'),
(208, 3, 61, '4', NULL, '[]', '2025-07-15 06:21:57'),
(209, 3, 62, '3', NULL, '[]', '2025-07-15 06:21:57'),
(210, 3, 63, '3', NULL, '[]', '2025-07-15 06:23:14'),
(211, 3, 64, '2', NULL, '[]', '2025-07-15 06:23:14'),
(212, 3, 65, '2', NULL, '[]', '2025-07-15 06:23:14'),
(213, 3, 66, '4', NULL, '[]', '2025-07-15 06:23:14'),
(214, 3, 67, '4', NULL, '[]', '2025-07-15 06:23:14'),
(215, 3, 68, '2', NULL, '[]', '2025-07-15 06:23:44'),
(216, 3, 69, '1', NULL, '[]', '2025-07-15 06:23:44'),
(217, 3, 70, '1', NULL, '[]', '2025-07-15 06:23:44'),
(218, 3, 71, '4', NULL, '[]', '2025-07-15 06:23:44'),
(219, 3, 72, '4', NULL, '[]', '2025-07-15 06:23:44'),
(220, 3, 73, '4', NULL, '[]', '2025-07-15 06:24:07'),
(221, 3, 74, '1', NULL, '[]', '2025-07-15 06:24:07'),
(222, 3, 75, '2', NULL, '[]', '2025-07-15 06:24:07'),
(223, 3, 76, '2', NULL, '[]', '2025-07-15 06:24:07'),
(224, 3, 77, '2', NULL, '[]', '2025-07-15 06:24:07'),
(225, 3, 78, '2', NULL, '[]', '2025-07-15 06:24:39'),
(226, 3, 79, '1', NULL, '[]', '2025-07-15 06:24:39'),
(227, 3, 80, '3', NULL, '[]', '2025-07-15 06:24:39'),
(228, 3, 81, '2', NULL, '[]', '2025-07-15 06:24:39'),
(229, 3, 82, '2', NULL, '[]', '2025-07-15 06:24:39'),
(230, 3, 83, '4', NULL, '[]', '2025-07-15 06:25:01'),
(231, 3, 84, '4', NULL, '[]', '2025-07-15 06:25:01'),
(232, 4, 1, '4', NULL, '[]', '2025-07-16 09:59:25'),
(233, 4, 2, '4', NULL, '[]', '2025-07-16 09:59:25'),
(234, 4, 3, '5', NULL, '[]', '2025-07-16 09:59:25'),
(235, 4, 4, '4', NULL, '[]', '2025-07-16 09:59:25'),
(236, 4, 5, '4', NULL, '[]', '2025-07-16 09:59:25'),
(237, 4, 6, '4', NULL, '[]', '2025-07-16 10:01:03'),
(238, 4, 7, '1', NULL, '[]', '2025-07-16 10:01:03'),
(239, 4, 8, '1', NULL, '[]', '2025-07-16 10:01:03'),
(240, 4, 9, '1', NULL, '[]', '2025-07-16 10:01:03'),
(241, 4, 10, '5', NULL, '[]', '2025-07-16 10:01:03'),
(242, 4, 11, '3', NULL, '[]', '2025-07-16 10:01:40'),
(243, 4, 12, '4', NULL, '[]', '2025-07-16 10:01:40'),
(244, 4, 13, '4', NULL, '[]', '2025-07-16 10:01:40'),
(245, 4, 14, '4', NULL, '[]', '2025-07-16 10:01:40'),
(246, 4, 15, '5', NULL, '[]', '2025-07-16 10:01:40'),
(247, 4, 16, '5', NULL, '[]', '2025-07-16 10:02:59'),
(248, 4, 17, '5', NULL, '[]', '2025-07-16 10:02:59'),
(249, 4, 18, '5', NULL, '[]', '2025-07-16 10:02:59'),
(250, 4, 19, '5', NULL, '[]', '2025-07-16 10:02:59'),
(251, 4, 20, 'N/A', 'There is no way to assess the sexual activities the resident is involved in. At the organization, she does not have the opportunity to engage in it.', '[]', '2025-07-16 10:02:59'),
(252, 4, 21, '5', NULL, '[]', '2025-07-16 10:03:56'),
(253, 4, 22, '4', NULL, '[]', '2025-07-16 10:03:56'),
(254, 4, 23, '5', NULL, '[]', '2025-07-16 10:03:56'),
(255, 4, 24, '5', NULL, '[]', '2025-07-16 10:03:56'),
(256, 4, 25, '30', NULL, '[]', '2025-07-16 10:03:56'),
(257, 4, 26, 'false', NULL, '[]', '2025-07-16 10:04:41'),
(258, 4, 34, '5', NULL, '[]', '2025-07-16 10:04:41'),
(259, 4, 35, '5', NULL, '[]', '2025-07-16 10:04:41'),
(260, 4, 36, '5', NULL, '[]', '2025-07-16 10:04:41'),
(261, 4, 37, '5', NULL, '[]', '2025-07-16 10:04:41'),
(262, 4, 38, '5', NULL, '[]', '2025-07-16 10:05:40'),
(263, 4, 39, 'N/A', 'There is not any information regarding her family', '[]', '2025-07-16 10:05:40'),
(264, 4, 40, 'N/A', 'There is no information regarding the family.', '[]', '2025-07-16 10:05:40'),
(265, 4, 41, '5', NULL, '[]', '2025-07-16 10:05:40'),
(266, 4, 42, '30', NULL, '[]', '2025-07-16 10:05:40'),
(267, 4, 43, '25', NULL, '[]', '2025-07-16 10:07:58'),
(268, 4, 44, '23', NULL, '[]', '2025-07-16 10:07:58'),
(269, 4, 45, '4', NULL, '[\"Dental care\", \"Taking a bath\", \"Hair care\", \"Skin care\", \"Nail care\"]', '2025-07-16 10:07:58'),
(270, 4, 46, '4', NULL, '[\"Choosing clean clothing\", \"Appropriate choice of clothing according to weather/occasion\", \"Completing laundry\", \"Notifying staff if clothing needs repair or replacement\"]', '2025-07-16 10:07:58'),
(271, 4, 47, '5', NULL, '[\"Eating adequately\", \"Following dietary restrictions\", \"Attending scheduled meals in the dining area\"]', '2025-07-16 10:07:58'),
(272, 4, 48, '4', NULL, '[\"Making one\\u2019s own bed\", \"Keeping personal space tidy\", \"Organizing personal belongings\", \"Disposing garbage\", \"Washing own dishes\"]', '2025-07-16 10:09:55'),
(273, 4, 49, '4', NULL, '[\"Staying on topic\", \"Maintaining appropriate eye contact\", \"Appropriate use of tone and volume\", \"Expressing needs and preferences to staff\"]', '2025-07-16 10:09:55'),
(274, 4, 50, '5', NULL, '[\"Appropriate and polite greetings\", \"Respecting personal space\", \"Managing emotions in social setting\", \"Recognizing other\\u2019s feelings and responding appropriately\", \"Understanding social rules and customs\", \"Following time and schedule for activities\"]', '2025-07-16 10:09:55'),
(275, 4, 51, '5', NULL, '[\"Interactions with residents and staff\", \"Participating in group activities\", \"Forming friendships/acquaintances with residents and staff\", \"Offering support to fellow residents\", \"Receiving support from residents and staff\", \"Resolving conflicts with residents and staff\", \"Interest in forming new connections\"]', '2025-07-16 10:09:55'),
(276, 4, 52, '2', NULL, '[]', '2025-07-16 10:09:55'),
(277, 4, 53, '3', NULL, '[\"Awareness of current location and time\", \"Navigating the compounds of the organization\", \"Ability to use public transport\", \"Understanding and following directions for simple routes\"]', '2025-07-16 10:11:32'),
(278, 4, 54, '4', NULL, '[\"Making request to staff for assistance or supplies\", \"Using facility phone to make personal calls\", \"Attending scheduled appointments\", \"Understanding roles of professionals involved in their care\", \"Recognizing and communicating when not feeling well\"]', '2025-07-16 10:11:32'),
(279, 4, 55, '5', NULL, '[\"Participating in recreational activities\", \"Using free time for leisure or preferred activity\", \"Engaging in passive leisure activities\", \"Engaging in active leisure activities\"]', '2025-07-16 10:11:32'),
(280, 4, 56, '5', NULL, '[\"Participating in assigned facility duties or chores consistently\", \"Attending vocational rehabilitation groups or programs\", \"Completing tasks or activities assigned\"]', '2025-07-16 10:11:32'),
(281, 4, 57, '3', NULL, '[\"Taking care of common belongings\", \"Returning borrowed items promptly\", \"Taking care of personal belongings and property\", \"Asking permission before borrowing or using items belonging to others or the organization\"]', '2025-07-16 10:11:32'),
(282, 4, 58, '5', NULL, '[\"Adhering to rules and guidelines\", \"Managing personal hygiene and self-care routines\", \"Taking responsibility for minor mistakes or actions\", \"Participating in managing own medication\", \"Following safety instructions and procedures\"]', '2025-07-16 10:12:51'),
(283, 4, 59, '1', NULL, '[]', '2025-07-16 10:12:51'),
(284, 4, 60, '2', NULL, '[]', '2025-07-16 10:12:51'),
(285, 4, 61, '4', NULL, '[]', '2025-07-16 10:12:51'),
(286, 4, 62, '4', NULL, '[]', '2025-07-16 10:12:51'),
(287, 4, 63, '3', NULL, '[]', '2025-07-16 10:13:38'),
(288, 4, 64, '2', NULL, '[]', '2025-07-16 10:13:38'),
(289, 4, 65, '1', NULL, '[]', '2025-07-16 10:13:38'),
(290, 4, 66, '2', NULL, '[]', '2025-07-16 10:13:38'),
(291, 4, 67, '1', NULL, '[]', '2025-07-16 10:13:38'),
(292, 4, 68, '2', NULL, '[]', '2025-07-16 10:14:18'),
(293, 4, 69, '4', NULL, '[]', '2025-07-16 10:14:18'),
(294, 4, 70, '1', NULL, '[]', '2025-07-16 10:14:18'),
(295, 4, 71, '1', NULL, '[]', '2025-07-16 10:14:18'),
(296, 4, 72, '1', NULL, '[]', '2025-07-16 10:14:18'),
(297, 4, 73, '4', NULL, '[]', '2025-07-16 10:14:52'),
(298, 4, 74, '1', NULL, '[]', '2025-07-16 10:14:52'),
(299, 4, 75, '1', NULL, '[]', '2025-07-16 10:14:52'),
(300, 4, 76, '1', NULL, '[]', '2025-07-16 10:14:52'),
(301, 4, 77, '2', NULL, '[]', '2025-07-16 10:14:52'),
(302, 4, 78, '1', NULL, '[]', '2025-07-16 10:15:40'),
(303, 4, 79, '1', NULL, '[]', '2025-07-16 10:15:40'),
(304, 4, 80, '2', NULL, '[]', '2025-07-16 10:15:40'),
(305, 4, 81, '1', NULL, '[]', '2025-07-16 10:15:40'),
(306, 4, 82, '1', NULL, '[]', '2025-07-16 10:15:40'),
(307, 4, 83, '2', NULL, '[]', '2025-07-16 10:15:56'),
(308, 4, 84, '5', NULL, '[]', '2025-07-16 10:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `patient_assessment_scores`
--

CREATE TABLE `patient_assessment_scores` (
  `id` int(11) NOT NULL,
  `patient_assessment_id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `score` decimal(10,2) NOT NULL,
  `score_interpretation` text DEFAULT NULL,
  `calculated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_assessment_scores`
--

INSERT INTO `patient_assessment_scores` (`id`, `patient_assessment_id`, `domain`, `score`, `score_interpretation`, `calculated_at`) VALUES
(1, 1, 'WHODAS 2.0 Overall Score', 55.47, 'Overall disability score of 55.47 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(2, 1, 'WHODAS Domain 1: Cognition', 50.00, 'Domain score of 50.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(3, 1, 'WHODAS Domain 2: Mobility', 60.00, 'Domain score of 60.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(4, 1, 'WHODAS Domain 3: Self-Care', 75.00, 'Domain score of 75.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(5, 1, 'WHODAS Domain 4: Getting Along', 65.00, 'Domain score of 65.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(6, 1, 'WHODAS Domain 5: Life Activities', 37.50, 'Domain score of 37.5 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(7, 1, 'WHODAS Domain 6: Participation', 50.00, 'Domain score of 50.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 14:27:47'),
(8, 1, 'SOFS Overall Scaled Score', 55.36, 'Overall functioning score of 55.36 on a 0-100 scale. Lower scores indicate better functioning. (Raw score: 45)', '2025-07-14 14:27:47'),
(9, 1, 'WHOQoL Physical Health', 57.14, 'Domain score of 57.14 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 14:27:47'),
(10, 1, 'WHOQoL Psychological', 37.50, 'Domain score of 37.5 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 14:27:47'),
(11, 1, 'WHOQoL Social Relationships', 75.00, 'Domain score of 75.0 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 14:27:47'),
(12, 1, 'WHOQoL Environment', 18.75, 'Domain score of 18.75 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 14:27:47'),
(13, 1, 'WHOQoL Overall Quality of Life', 0.00, 'Overall quality of life score of 0.0 on a 0-100 scale.', '2025-07-14 14:27:47'),
(14, 1, 'WHOQoL General Health', 75.00, 'General health score of 75.0 on a 0-100 scale.', '2025-07-14 14:27:47'),
(15, 2, 'WHODAS 2.0 Overall Score', 61.72, 'Overall disability score of 61.72 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(16, 2, 'WHODAS Domain 1: Cognition', 70.83, 'Domain score of 70.83 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(17, 2, 'WHODAS Domain 2: Mobility', 55.00, 'Domain score of 55.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(18, 2, 'WHODAS Domain 3: Self-Care', 75.00, 'Domain score of 75.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(19, 2, 'WHODAS Domain 4: Getting Along', 60.00, 'Domain score of 60.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(20, 2, 'WHODAS Domain 5: Life Activities', 50.00, 'Domain score of 50.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(21, 2, 'WHODAS Domain 6: Participation', 59.38, 'Domain score of 59.38 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-14 17:31:16'),
(22, 2, 'SOFS Overall Scaled Score', 50.00, 'Overall functioning score of 50.0 on a 0-100 scale. Lower scores indicate better functioning. (Raw score: 42)', '2025-07-14 17:31:16'),
(23, 2, 'WHOQoL Physical Health', 39.29, 'Domain score of 39.29 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 17:31:16'),
(24, 2, 'WHOQoL Psychological', 33.33, 'Domain score of 33.33 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 17:31:16'),
(25, 2, 'WHOQoL Social Relationships', 25.00, 'Domain score of 25.0 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 17:31:16'),
(26, 2, 'WHOQoL Environment', 25.00, 'Domain score of 25.0 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-14 17:31:16'),
(27, 2, 'WHOQoL Overall Quality of Life', 25.00, 'Overall quality of life score of 25.0 on a 0-100 scale.', '2025-07-14 17:31:16'),
(28, 2, 'WHOQoL General Health', 25.00, 'General health score of 25.0 on a 0-100 scale.', '2025-07-14 17:31:16'),
(29, 3, 'WHODAS 2.0 Overall Score', 35.34, 'Overall disability score of 35.34 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(30, 3, 'WHODAS Domain 1: Cognition', 37.50, 'Domain score of 37.5 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(31, 3, 'WHODAS Domain 2: Mobility', 20.00, 'Domain score of 20.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(32, 3, 'WHODAS Domain 3: Self-Care', 0.00, 'Domain score of 0.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(33, 3, 'WHODAS Domain 4: Getting Along', 56.25, 'Domain score of 56.25 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(34, 3, 'WHODAS Domain 5: Life Activities', 62.50, 'Domain score of 62.5 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(35, 3, 'WHODAS Domain 6: Participation', 32.14, 'Domain score of 32.14 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-15 06:25:11'),
(36, 3, 'SOFS Overall Scaled Score', 32.14, 'Overall functioning score of 32.14 on a 0-100 scale. Lower scores indicate better functioning. (Raw score: 32)', '2025-07-15 06:25:11'),
(37, 3, 'WHOQoL Physical Health', 32.14, 'Domain score of 32.14 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-15 06:25:11'),
(38, 3, 'WHOQoL Psychological', 25.00, 'Domain score of 25.0 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-15 06:25:11'),
(39, 3, 'WHOQoL Social Relationships', 25.00, 'Domain score of 25.0 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-15 06:25:11'),
(40, 3, 'WHOQoL Environment', 53.12, 'Domain score of 53.12 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-15 06:25:11'),
(41, 3, 'WHOQoL Overall Quality of Life', 25.00, 'Overall quality of life score of 25.0 on a 0-100 scale.', '2025-07-15 06:25:11'),
(42, 3, 'WHOQoL General Health', 25.00, 'General health score of 25.0 on a 0-100 scale.', '2025-07-15 06:25:11'),
(43, 4, 'WHODAS 2.0 Overall Score', 80.17, 'Overall disability score of 80.17 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:10'),
(44, 4, 'WHODAS Domain 1: Cognition', 79.17, 'Domain score of 79.17 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:11'),
(45, 4, 'WHODAS Domain 2: Mobility', 30.00, 'Domain score of 30.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:11'),
(46, 4, 'WHODAS Domain 3: Self-Care', 81.25, 'Domain score of 81.25 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:11'),
(47, 4, 'WHODAS Domain 4: Getting Along', 100.00, 'Domain score of 100.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:11'),
(48, 4, 'WHODAS Domain 5: Life Activities', 93.75, 'Domain score of 93.75 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:11'),
(49, 4, 'WHODAS Domain 6: Participation', 100.00, 'Domain score of 100.0 on a 0-100 scale (0=no disability, 100=full disability).', '2025-07-16 10:16:11'),
(50, 4, 'SOFS Overall Scaled Score', 78.57, 'Overall functioning score of 78.57 on a 0-100 scale. Lower scores indicate better functioning. (Raw score: 58)', '2025-07-16 10:16:11'),
(51, 4, 'WHOQoL Physical Health', 21.43, 'Domain score of 21.43 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-16 10:16:11'),
(52, 4, 'WHOQoL Psychological', 29.17, 'Domain score of 29.17 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-16 10:16:11'),
(53, 4, 'WHOQoL Social Relationships', 8.33, 'Domain score of 8.33 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-16 10:16:11'),
(54, 4, 'WHOQoL Environment', 6.25, 'Domain score of 6.25 on a 0-100 scale. Higher scores indicate better quality of life.', '2025-07-16 10:16:11'),
(55, 4, 'WHOQoL Overall Quality of Life', 0.00, 'Overall quality of life score of 0.0 on a 0-100 scale.', '2025-07-16 10:16:11'),
(56, 4, 'WHOQoL General Health', 25.00, 'General health score of 25.0 on a 0-100 scale.', '2025-07-16 10:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `patient_observations`
--

CREATE TABLE `patient_observations` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `observation_date` date NOT NULL,
  `symptoms_negative` text DEFAULT NULL,
  `symptoms_positive` text DEFAULT NULL,
  `symptoms_cognitive` text DEFAULT NULL,
  `symptoms_other` text DEFAULT NULL,
  `observation_notes` text DEFAULT NULL,
  `psychopathology_status` varchar(100) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_observations`
--

INSERT INTO `patient_observations` (`id`, `patient_id`, `observation_date`, `symptoms_negative`, `symptoms_positive`, `symptoms_cognitive`, `symptoms_other`, `observation_notes`, `psychopathology_status`, `staff_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-07-06', 'Blunted affect,Emotional withdrawal,Lack of spontaneity', 'Delusion,Grandiosity,Excitement', 'Poor attention & concentration,Poor social judgement', 'Communication difficulties,Neglected self-care', '', 'Well-stabilized', 1, '2025-07-06 10:21:01', '2025-07-06 10:21:01'),
(2, 2, '2025-07-06', 'Blunted affect,Emotional withdrawal', 'Delusion,Excitement', 'Poor attention & concentration,Poor social judgement', 'Urinary or fecal incontinence,Self-harming behaviour,Communication difficulties', '', 'Moderately stabilized', 1, '2025-07-06 10:25:57', '2025-07-06 10:25:57'),
(3, 3, '2025-07-15', 'Poor rapport', 'Delusion,Grandiosity,Hostility', 'Impaired memory,Poor attention & concentration', 'Mood swings,Sleep disturbance', 'The resident displays rapid speech and frequent topic shifts. Initially exhibiting elevated mood and excitement, she gradually became more lethargic, likely due to medication. She often gets into arguments with healthcare workers and other service users and becomes easily irritable. She moves around a lot but does not engage in any activities with other service users. She is alert and aware but loses attention quickly. ', 'In active psychopathology', 3, '2025-07-15 05:57:40', '2025-07-15 05:57:40'),
(4, 4, '2025-07-16', 'Emotional withdrawal,Poor rapport', 'Delusion,Hostility', 'Poor attention & concentration,Impaired memory', 'Neglected self-care,Communication difficulties,Mood swings,Sleep disturbance', 'The resident presented with marked hostility upon admission and required forceful medication to stabilize. She consistently maintains a rude and aggressive demeanor towards both staff and fellow residents. She frequently demands to be discharged, asserting she has no mental health issues. There are clear delusional themes, including claims of having a husband and son who are untraceable, a delusion of pregnancy, and significant paranoia that the staff intends to harm her. Her speech patterns suggest a prior level of education.', 'In active psychopathology', 3, '2025-07-16 09:57:54', '2025-07-16 09:57:54'),
(5, 1, '2025-08-02', 'Blunted affect', 'Grandiosity,Excitement', 'Motor retardation,Poor social judgement', 'Absconding tendency', 'nil', 'Moderately stabilized', 1, '2025-08-02 08:59:23', '2025-08-02 08:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `reminder_text` text NOT NULL,
  `reminder_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `institution_id`, `patient_id`, `staff_id`, `reminder_text`, `reminder_date`, `status`, `completed_at`) VALUES
(17, 17, 3, 3, 'Care plan review due for resident (ID: 3)', '2025-10-19', 'pending', NULL),
(25, 17, 4, 3, 'Care plan review due for resident (ID: 4)', '2025-10-21', 'pending', NULL),
(27, 14, 1, 1, 'Care plan review due for resident (ID: 1)', '2025-10-22', 'pending', NULL),
(33, 14, 1, 1, 'Care plan review due for resident (ID: 1)', '2025-10-31', 'pending', NULL),
(34, 14, 1, 1, 'Care plan review due for resident (ID: 1)', '2025-10-31', 'pending', NULL),
(35, 17, 4, 3, 'nil', '2025-08-03', 'completed', '2025-08-03 12:02:24'),
(36, 17, 3, 3, 'Care plan review due for resident (ID: 3)', '2025-11-03', 'pending', NULL),
(37, 17, 3, 3, 'Care plan review due for resident (ID: 3)', '2025-11-04', 'pending', NULL),
(38, 17, 3, 3, 'Care plan review due for resident (ID: 3)', '2025-11-04', 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `institution_id` int(11) NOT NULL,
  `role_type` enum('permanent','volunteer','contract','intern') DEFAULT NULL,
  `role_category` enum('psychiatrist','psychologist','nurse','counsellor','social_worker','vocational_trainer','caregiver','housekeeping','cook','physician','other') DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `visit_frequency` enum('daily','weekly','bi-weekly','monthly','on-call') DEFAULT NULL,
  `is_visiting` tinyint(1) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `full_name`, `phone`, `address`, `institution_id`, `role_type`, `role_category`, `specialization`, `qualification`, `experience_years`, `visit_frequency`, `is_visiting`, `department`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Albin Joseph', '9207931308', 'puthenpurayil(h), valad(p.o), valad, wayanad', 14, 'permanent', 'other', 'aaa', 'MSW', 0, 'daily', 1, 'dffdf', '2025-06-26 16:01:43', '2025-08-02 16:05:53', 'active'),
(2, 'staff_institution2', '0465464646', 'demo address', 15, 'permanent', 'psychiatrist', 'psychology', 'MSW', 2, 'daily', 0, 'psychology', '2025-07-04 10:35:55', '2025-07-04 10:35:55', 'active'),
(3, 'MS_Staff1', '9999999999', 'Ernakulam', 17, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, '2025-07-15 04:59:56', '2025-07-15 04:59:56', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `staff_activity_logs`
--

CREATE TABLE `staff_activity_logs` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `action` enum('create_record','update_record','delete_record','system_process','system_error','login','logout','view_record','export_data','api_call') NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_activity_logs`
--

INSERT INTO `staff_activity_logs` (`id`, `staff_id`, `action`, `table_name`, `details`, `ip_address`, `timestamp`) VALUES
(1, 3, 'update_record', 'patients', 'Updated resident DR (ID: 3): Changed `duration_of_homelessness_months` from \'2\' to \'7\'', '127.0.0.1', '2025-08-03 23:32:35'),
(2, 3, 'update_record', 'patients', 'Updated resident DR (ID: 3): Changed `gender` from \'Male\' to \'Female\'', '127.0.0.1', '2025-08-03 23:33:02'),
(3, 3, 'delete_record', 'treatment_plans', 'Deleted treatment plan ID: 28 | Patient: DR (ID: 3) | Version: 1 | Goals: 10', '127.0.0.1', '2025-08-04 04:41:13'),
(4, 3, 'system_error', 'treatment_plans', 'Failed to generate care plan for patient ID: 3', '127.0.0.1', '2025-08-04 04:41:18'),
(5, 3, 'create_record', 'treatment_plans', 'Created treatment plan ID: 35 (v1) with 12 goals for patient ID: 3', '127.0.0.1', '2025-08-05 04:05:06'),
(6, 3, 'update_record', 'treatment_plans', 'Updated treatment plan ID: 35 for Patient ID: 3. Changes: care_plan_edit_summary: \'None\' → \'edit summary detailss\'.', '127.0.0.1', '2025-08-05 09:52:16'),
(7, 3, 'delete_record', 'treatment_plans', 'Deleted treatment plan ID: 35 | Patient: DR (ID: 3) | Version: 1 | Goals: 12', '127.0.0.1', '2025-08-05 23:06:08'),
(8, 3, 'create_record', 'treatment_plans', 'Created treatment plan ID: 36 (v1) with 11 goals for patient ID: 3', '127.0.0.1', '2025-08-05 23:06:32'),
(9, 3, 'update_record', 'treatment_plans', 'Updated treatment plan ID: 36 for Patient ID: 3. Changes: care_plan_edit_summary: \'None\' → \'summary\'.', '127.0.0.1', '2025-08-06 00:12:37'),
(10, 3, 'delete_record', 'treatment_plans', 'Deleted treatment plan ID: 36 | Patient: DR (ID: 3) | Version: 1 | Goals: 11', '127.0.0.1', '2025-08-06 04:49:41'),
(11, 3, 'create_record', 'treatment_plans', 'Created treatment plan ID: 37 (v1) with 11 goals for patient ID: 3', '127.0.0.1', '2025-08-06 04:50:08'),
(12, 3, 'update_record', 'care_plan_goals', 'Reordered 11 goals in treatment plan ID: 37. New order: 376, 378, 377, 379, 380, 381, 382, 383, 384, 385, 386', '127.0.0.1', '2025-08-06 23:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_plans`
--

CREATE TABLE `treatment_plans` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `created_by_staff_id` int(11) NOT NULL,
  `patient_assessment_id` int(11) NOT NULL,
  `patient_observation_id` int(11) DEFAULT NULL,
  `institution_service_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `assessment_change_summary_id` int(11) DEFAULT NULL,
  `version_number` int(11) NOT NULL,
  `previous_plan_id` int(11) DEFAULT NULL,
  `plan_start_date` date NOT NULL,
  `plan_end_date` date DEFAULT NULL,
  `status` enum('active','in_progress','completed','cancelled') NOT NULL,
  `ai_model_version` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `brief_background_summary` text DEFAULT NULL,
  `disability_and_functioning_summary` text DEFAULT NULL,
  `strengths_and_aspirations_summary` text DEFAULT NULL,
  `risks_and_concerns` text DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `care_plan_edit_summary` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_plans`
--

INSERT INTO `treatment_plans` (`id`, `patient_id`, `created_by_staff_id`, `patient_assessment_id`, `patient_observation_id`, `institution_service_ids`, `assessment_change_summary_id`, `version_number`, `previous_plan_id`, `plan_start_date`, `plan_end_date`, `status`, `ai_model_version`, `created_at`, `updated_at`, `brief_background_summary`, `disability_and_functioning_summary`, `strengths_and_aspirations_summary`, `risks_and_concerns`, `review_date`, `additional_notes`, `care_plan_edit_summary`) VALUES
(2, 1, 1, 1, NULL, NULL, NULL, 1, NULL, '2025-07-14', NULL, 'active', 'gpt-4o', '2025-07-14 17:28:19', '2025-07-14 17:28:19', 'The patient is a 22-year-old single male, admitted on July 6, 2025, via police referral. He has been homeless for 1 year and 2 months and has a history of staying in a rehabilitation center for psychotic disorder. The patient is compliant with medication and treatment, has aspirations to return home, learn a vocation, live independently, and manage symptoms better. He is slightly willing to change.', 'The overall WHODAS score is 55.47, indicating moderate disability. Significant challenges are noted in self-care (75.00) and getting along (65.00). There are also moderate difficulties in cognition (50.00), mobility (60.00), and participation (50.00). The patient exhibits lower disability in life activities (37.50). The SOFS score of 55.36 reflects moderate functional impairment.', 'The patient is creative, physically active, and compliant with treatment. He aspires to reunite with his family, acquire new skills, live independently, and improve symptom management.', 'The patient has a psychotic disorder with co-existing diabetes, hypertension, skin infections, and hearing impairment. The prior homelessness and moderate disability scores indicate a need for stable housing and support. He is under medication for both physical and psychiatric health.', '2025-10-12', NULL, NULL),
(26, 4, 3, 4, NULL, NULL, NULL, 1, NULL, '2025-07-23', NULL, 'active', 'gpt-4.1', '2025-07-23 09:31:23', '2025-07-23 09:31:23', 'The resident is a 27-year-old female admitted via community referral following three months of homelessness, presenting with severe psychotic symptoms including prominent delusions, profound lack of insight, and marked hostility. She has no known family contact and no history of rehabilitation. Upon admission, she required emergency care and forceful administration of psychiatric medication due to her aggressive and uncooperative behavior. She is currently diagnosed with a psychotic disorder, with significant functional and social impairments as evidenced by assessment scores.', 'Assessment scores indicate severe global disability (WHODAS 80.17/100), with especially high impairment in self-care, social interaction, life activities, and participation. Cognitive functioning is significantly impaired, with substantial difficulties in concentration, memory, and reasoning. Self-care abilities are markedly reduced, including difficulties with personal hygiene, dressing, and eating. Social-occupational functioning is severely limited, with high scores indicating inability to engage in social or work activities and persistent problems in forming or maintaining relationships. Mobility within the facility is only mildly impaired.', 'The resident demonstrates basic literacy and numeracy, suggesting foundational cognitive skills. Her primary aspiration is to return to her family and home, although this is not currently feasible due to the inability to trace her family and her ongoing severe psychopathology.', '- High risk of aggression towards staff and peers due to active hostility and delusions.\n- Persistent medication non-adherence risking relapse or worsening symptoms.\n- Profound lack of insight, impeding engagement and therapeutic alliance.\n- Social isolation and complete lack of family support.\n- Physical health concerns including anaemia and being underweight.\n- Vulnerability related to recent homelessness and lack of social safety net.', '2025-10-21', NULL, NULL),
(34, 1, 1, 2, NULL, NULL, 15, 2, NULL, '2025-08-02', NULL, 'active', 'gpt-4.1', '2025-08-02 09:13:53', '2025-08-02 09:13:53', 'Resident 1 is a 22-year-old single male, admitted as a new resident via police referral after over a year of homelessness. He has a provisional diagnosis of psychotic disorder with comorbid diabetes, hypertension, skin infections, and hearing impairment. Previous rehabilitation history is noted. He is currently stabilized on psychiatric and physical health medications, with no reported medication adherence issues. He expresses aspirations to return to his family, learn new skills, live independently, and manage symptoms better. Family involvement is present.', 'Assessment results indicate significant impairment across multiple domains: severe cognitive difficulties (notably in concentration, memory, and problem-solving), high self-care disability (notably in washing, dressing, and eating), moderate mobility challenges, and substantial challenges in social engagement, life activities, and community participation. Social-occupational functioning is compromised, especially in hygiene, social engagement, recreation, and orientation/mobility. Quality of life and satisfaction scores are low across all domains.', 'Resident demonstrates compliance with treatment, creativity, and physical activity. He is slightly willing to engage in change, with aspirations for family reintegration, skill development, independent living, and better symptom management. He is physically active, expresses interest in learning, and maintains some family contact.', '- Vulnerability due to recent homelessness and psychotic disorder.\n- History of moderate to severe functional impairment in self-care, mobility, and cognition.\n- Potential for deterioration in physical health due to comorbid diabetes, hypertension, and skin infections.\n- Social isolation and low participation in life activities.\n- Low overall quality of life and satisfaction with environment, relationships, and health.\n- Impaired orientation and limited ability to use public transport.\n- Possible risk of skin breakdown or infections due to self-care deficits.\n- Hearing impairment impacting communication and engagement.', '2025-10-31', NULL, NULL),
(37, 3, 3, 3, NULL, NULL, NULL, 1, NULL, '2025-08-06', NULL, 'active', 'gpt-4.1', '2025-08-06 10:20:08', '2025-08-06 10:20:08', 'The resident is a 35-year-old homeless female admitted on 2025-04-15, with a provisional diagnosis of Bipolar Affective Disorder and known comorbidity of diabetes. She exhibits active psychopathology with rapid speech, irritability, arguments with staff and peers, and fluctuating mood. Her history reflects difficulties in social interactions, participation in activities, and household/work functioning. She is administered medication by nursing staff and receives basic medical care on site.', 'The resident demonstrates moderate overall disability (WHODAS 2.0 score: 35.34), with notable impairments in getting along with others (56.25), life activities (62.5), and cognition (37.5). Self-care is preserved (0.0), but there are difficulties in household responsibilities, social engagement, and sustained participation in meaningful activities. SOFS reveals challenges in social engagement, conversational skills, vocational participation, and maintaining personal space. Quality of life scores are low, especially in psychological and social domains.', 'The resident is alert, aware of her surroundings, and generally maintains self-care. She is able to move independently and participate in daily routines to some extent. There is potential for improvement in social and vocational functioning, and she may benefit from structured group and skill-based activities available at the center, as well as psychoeducation tailored to her needs.', '- Active mood symptoms including irritability and rapid speech.\n- History of arguments and conflict with staff and peers.\n- Potential for medication non-adherence if not supervised.\n- Presence of diabetes requiring regular management.\n- Low psychological and social quality of life, with frequent negative feelings.\n- Reduced engagement in meaningful activities, risking further isolation.', '2025-11-04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `user_type` enum('ADMIN','INSTITUTION','STAFF') NOT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `user_type`, `institution_id`, `staff_id`, `is_active`) VALUES
(1, 'admin', 'admin@example.com', '$2b$12$4hlZ9atbMAqlmT8DmSMOh.Qu.04ITVeFCnMBmnd.PpuTjSjvdYzpC', 'ADMIN', NULL, NULL, 1),
(21, 'institution', 'albinjoseph229@gmail.com', '$2b$12$OtD1KxCWZAGQyFgM/.AD0O532vMbzbj59SpCU262Y9LWJ6hUA1LTG', 'INSTITUTION', 14, NULL, 1),
(22, 'staff', 'staff@gmail.com', '$2b$12$GCbSB5aWXlIwA1fN0f1eoe9pJHSZ8mcsQT7nwviAdDYw0eqvbveQK', 'STAFF', NULL, 1, 1),
(23, 'institution2', 'albinjoseph@gmail.com', '$2b$12$AyChUsVVwio29Ble84GWweP8E002uuwKmQCgaHFgyOtBiOXefEdse', 'INSTITUTION', 15, NULL, 1),
(24, 'staff_institution2', 'staff_institution2@example.com', '$2b$12$kCCFbMonhSlWfzicwei0kuWBTnOGdscXNky8rAuD6HDBDEly27Ss2', 'STAFF', NULL, 2, 1),
(25, 'Mariyasadanam', 'orgdemo@abc.com', '$2b$12$X1qZpEGUaAL0XgD4Chbcf.W6GmJMBGVqzXmW3qTSPi/ndOsdW.3lG', 'INSTITUTION', 17, NULL, 1),
(26, 'msstaff1', 'masstaff1@xyz.com', '$2b$12$AoGmIlPdh68PvpFmc/wvPeQ9FGdqQwrtlDsO6BF2BW.abSq/6NcWW', 'STAFF', NULL, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assessment_name` (`assessment_name`),
  ADD KEY `ix_assessments_id` (`id`);

--
-- Indexes for table `assessment_change_summaries`
--
ALTER TABLE `assessment_change_summaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `previous_assessment_id` (`previous_assessment_id`),
  ADD KEY `current_assessment_id` (`current_assessment_id`),
  ADD KEY `created_by_staff_id` (`created_by_staff_id`),
  ADD KEY `ix_assessment_change_summaries_patient_id` (`patient_id`);

--
-- Indexes for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_code` (`question_code`),
  ADD KEY `assessment_id` (`assessment_id`),
  ADD KEY `ix_assessment_questions_id` (`id`);

--
-- Indexes for table `care_plan_goals`
--
ALTER TABLE `care_plan_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_care_plan_goals_treatment_plan_id` (`treatment_plan_id`);

--
-- Indexes for table `care_plan_statuses`
--
ALTER TABLE `care_plan_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_care_plan_statuses_care_plan_goal_id` (`care_plan_goal_id`);

--
-- Indexes for table `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `institution_name` (`institution_name`),
  ADD KEY `ix_institutions_id` (`id`);

--
-- Indexes for table `institution_resident_demographics`
--
ALTER TABLE `institution_resident_demographics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `institution_id` (`institution_id`),
  ADD KEY `ix_institution_resident_demographics_id` (`id`);

--
-- Indexes for table `institution_resident_diagnoses`
--
ALTER TABLE `institution_resident_diagnoses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `ix_institution_resident_diagnoses_id` (`id`);

--
-- Indexes for table `institution_services`
--
ALTER TABLE `institution_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `ix_institution_services_id` (`id`);

--
-- Indexes for table `institution_staff_composition`
--
ALTER TABLE `institution_staff_composition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `ix_institution_staff_composition_id` (`id`);

--
-- Indexes for table `institution_staff_roles`
--
ALTER TABLE `institution_staff_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `ix_institution_staff_roles_id` (`id`);

--
-- Indexes for table `institution_visiting_staff`
--
ALTER TABLE `institution_visiting_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `ix_institution_visiting_staff_id` (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_otps_id` (`id`),
  ADD KEY `ix_otps_email` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `ix_patients_id` (`id`);

--
-- Indexes for table `patient_assessments`
--
ALTER TABLE `patient_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `assessment_id` (`assessment_id`),
  ADD KEY `assessed_by_staff_id` (`assessed_by_staff_id`),
  ADD KEY `ix_patient_assessments_id` (`id`);

--
-- Indexes for table `patient_assessment_responses`
--
ALTER TABLE `patient_assessment_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_assessment_id` (`patient_assessment_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `ix_patient_assessment_responses_id` (`id`);

--
-- Indexes for table `patient_assessment_scores`
--
ALTER TABLE `patient_assessment_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_assessment_id` (`patient_assessment_id`),
  ADD KEY `ix_patient_assessment_scores_id` (`id`);

--
-- Indexes for table `patient_observations`
--
ALTER TABLE `patient_observations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `ix_patient_observations_id` (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `ix_reminders_id` (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_staff_id` (`id`),
  ADD KEY `ix_staff_institution_id` (`institution_id`);

--
-- Indexes for table `staff_activity_logs`
--
ALTER TABLE `staff_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `treatment_plans`
--
ALTER TABLE `treatment_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assessment_change_summary_id` (`assessment_change_summary_id`),
  ADD KEY `created_by_staff_id` (`created_by_staff_id`),
  ADD KEY `patient_assessment_id` (`patient_assessment_id`),
  ADD KEY `patient_observation_id` (`patient_observation_id`),
  ADD KEY `previous_plan_id` (`previous_plan_id`),
  ADD KEY `ix_treatment_plans_patient_id` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_users_username` (`username`),
  ADD UNIQUE KEY `ix_users_email` (`email`),
  ADD UNIQUE KEY `ix_users_staff_id` (`staff_id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `ix_users_id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assessment_change_summaries`
--
ALTER TABLE `assessment_change_summaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `care_plan_goals`
--
ALTER TABLE `care_plan_goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT for table `care_plan_statuses`
--
ALTER TABLE `care_plan_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `institution_resident_demographics`
--
ALTER TABLE `institution_resident_demographics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `institution_resident_diagnoses`
--
ALTER TABLE `institution_resident_diagnoses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `institution_services`
--
ALTER TABLE `institution_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `institution_staff_composition`
--
ALTER TABLE `institution_staff_composition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `institution_staff_roles`
--
ALTER TABLE `institution_staff_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `institution_visiting_staff`
--
ALTER TABLE `institution_visiting_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient_assessments`
--
ALTER TABLE `patient_assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient_assessment_responses`
--
ALTER TABLE `patient_assessment_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `patient_assessment_scores`
--
ALTER TABLE `patient_assessment_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `patient_observations`
--
ALTER TABLE `patient_observations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_activity_logs`
--
ALTER TABLE `staff_activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `treatment_plans`
--
ALTER TABLE `treatment_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_change_summaries`
--
ALTER TABLE `assessment_change_summaries`
  ADD CONSTRAINT `assessment_change_summaries_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `assessment_change_summaries_ibfk_2` FOREIGN KEY (`previous_assessment_id`) REFERENCES `patient_assessments` (`id`),
  ADD CONSTRAINT `assessment_change_summaries_ibfk_3` FOREIGN KEY (`current_assessment_id`) REFERENCES `patient_assessments` (`id`),
  ADD CONSTRAINT `assessment_change_summaries_ibfk_4` FOREIGN KEY (`created_by_staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD CONSTRAINT `assessment_questions_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`);

--
-- Constraints for table `care_plan_goals`
--
ALTER TABLE `care_plan_goals`
  ADD CONSTRAINT `care_plan_goals_ibfk_1` FOREIGN KEY (`treatment_plan_id`) REFERENCES `treatment_plans` (`id`);

--
-- Constraints for table `care_plan_statuses`
--
ALTER TABLE `care_plan_statuses`
  ADD CONSTRAINT `care_plan_statuses_ibfk_1` FOREIGN KEY (`care_plan_goal_id`) REFERENCES `care_plan_goals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `institution_resident_demographics`
--
ALTER TABLE `institution_resident_demographics`
  ADD CONSTRAINT `institution_resident_demographics_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `institution_resident_diagnoses`
--
ALTER TABLE `institution_resident_diagnoses`
  ADD CONSTRAINT `institution_resident_diagnoses_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `institution_services`
--
ALTER TABLE `institution_services`
  ADD CONSTRAINT `institution_services_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `institution_staff_composition`
--
ALTER TABLE `institution_staff_composition`
  ADD CONSTRAINT `institution_staff_composition_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `institution_staff_roles`
--
ALTER TABLE `institution_staff_roles`
  ADD CONSTRAINT `institution_staff_roles_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `institution_visiting_staff`
--
ALTER TABLE `institution_visiting_staff`
  ADD CONSTRAINT `institution_visiting_staff_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `patient_assessments`
--
ALTER TABLE `patient_assessments`
  ADD CONSTRAINT `patient_assessments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `patient_assessments_ibfk_2` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`),
  ADD CONSTRAINT `patient_assessments_ibfk_3` FOREIGN KEY (`assessed_by_staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `patient_assessment_responses`
--
ALTER TABLE `patient_assessment_responses`
  ADD CONSTRAINT `patient_assessment_responses_ibfk_1` FOREIGN KEY (`patient_assessment_id`) REFERENCES `patient_assessments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_assessment_responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `assessment_questions` (`id`);

--
-- Constraints for table `patient_assessment_scores`
--
ALTER TABLE `patient_assessment_scores`
  ADD CONSTRAINT `patient_assessment_scores_ibfk_1` FOREIGN KEY (`patient_assessment_id`) REFERENCES `patient_assessments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_observations`
--
ALTER TABLE `patient_observations`
  ADD CONSTRAINT `patient_observations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `patient_observations_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `reminders_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reminders_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

--
-- Constraints for table `staff_activity_logs`
--
ALTER TABLE `staff_activity_logs`
  ADD CONSTRAINT `staff_activity_logs_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `treatment_plans`
--
ALTER TABLE `treatment_plans`
  ADD CONSTRAINT `treatment_plans_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `treatment_plans_ibfk_2` FOREIGN KEY (`created_by_staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `treatment_plans_ibfk_3` FOREIGN KEY (`patient_assessment_id`) REFERENCES `patient_assessments` (`id`),
  ADD CONSTRAINT `treatment_plans_ibfk_4` FOREIGN KEY (`patient_observation_id`) REFERENCES `patient_observations` (`id`),
  ADD CONSTRAINT `treatment_plans_ibfk_5` FOREIGN KEY (`assessment_change_summary_id`) REFERENCES `assessment_change_summaries` (`id`),
  ADD CONSTRAINT `treatment_plans_ibfk_6` FOREIGN KEY (`previous_plan_id`) REFERENCES `treatment_plans` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
