create table answers
(
    id               int auto_increment comment '回答ID'
        primary key,
    question_id      int                                   not null comment '问题ID',
    content          text                                  not null comment '回答内容',
    create_time      timestamp   default CURRENT_TIMESTAMP null comment '创建时间',
    author_id        int                                   null comment '作者ID',
    author_type      varchar(20) default 'user'            null comment '作者类型（user/ai）',
    is_accepted      tinyint(1)  default 0                 null comment '是否被采纳',
    confidence_score float                                 null comment '置信度评分',
    constraint answers_ibfk_1
        foreign key (question_id) references ehr.questions (id)
            on delete cascade,
    constraint answers_ibfk_2
        foreign key (author_id) references ehr.users (id)
            on delete set null
)
    comment '问题回答表';

create index author_id
    on answers (author_id);

create index question_id
    on answers (question_id);

create table books
(
    id          int auto_increment comment '书籍ID'
        primary key,
    name        varchar(128)                        not null comment '书名',
    book_author varchar(128)                        null comment '作者',
    introduce   text                                null comment '简介',
    create_time timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    cover       text                                null comment '封面图片'
)
    comment '知识书籍表';

create table chapters
(
    id          int auto_increment comment '章节ID'
        primary key,
    book_id     int                                 not null comment '所属书籍',
    title       varchar(256)                        not null comment '章节标题',
    content     text                                null comment '章节内容',
    parent_id   int                                 null comment '父章节ID',
    create_time timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    constraint chapters_ibfk_1
        foreign key (book_id) references ehr.books (id)
            on delete cascade,
    constraint chapters_ibfk_2
        foreign key (parent_id) references ehr.chapters (id)
            on delete set null
)
    comment '书籍章节表';

create index book_id
    on chapters (book_id);

create index parent_id
    on chapters (parent_id);

create table dialogue_sessions
(
    id         int auto_increment comment '会话ID'
        primary key,
    user_id    int                                   null comment '用户ID',
    start_time timestamp   default CURRENT_TIMESTAMP null comment '开始时间',
    end_time   timestamp                             null comment '结束时间',
    status     varchar(20) default 'in_progress'     null comment '状态',
    constraint dialogue_sessions_ibfk_1
        foreign key (user_id) references ehr.users (id)
            on delete set null
)
    comment 'AI问诊会话表';

create index user_id
    on dialogue_sessions (user_id);

create table dialogue_steps
(
    id                int auto_increment comment '步骤ID'
        primary key,
    session_id        int                                 not null comment '会话ID',
    step_index        int                                 not null comment '步骤索引',
    question          text                                null comment 'AI提问',
    user_reply        text                                null comment '用户回答',
    symptom_extracted text                                null comment '提取的症状标签（逗号分隔）',
    timestamp         timestamp default CURRENT_TIMESTAMP null comment '时间',
    constraint dialogue_steps_ibfk_1
        foreign key (session_id) references ehr.dialogue_sessions (id)
            on delete cascade
)
    comment 'AI问诊步骤表';

create index session_id
    on dialogue_steps (session_id);

create table knowledge_items
(
    id           int auto_increment comment '知识点ID'
        primary key,
    title        varchar(256)                        not null comment '标题',
    body         text                                not null comment '正文内容',
    tags         text                                null comment '标签（逗号分隔）',
    source       varchar(128)                        null comment '来源',
    updated_time timestamp default CURRENT_TIMESTAMP null comment '更新时间'
)
    comment '知识点内容表';

create table knowledge_tag
(
    item_id int not null comment '知识点ID',
    tag_id  int not null comment '标签ID',
    primary key (item_id, tag_id),
    constraint knowledge_tag_ibfk_1
        foreign key (item_id) references ehr.knowledge_items (id)
            on delete cascade,
    constraint knowledge_tag_ibfk_2
        foreign key (tag_id) references ehr.tags (id)
            on delete cascade
)
    comment '知识点与标签关联表';

create index tag_id
    on knowledge_tag (tag_id);

create table question_tag
(
    question_id int not null comment '问题ID',
    tag_id      int not null comment '标签ID',
    primary key (question_id, tag_id),
    constraint question_tag_ibfk_1
        foreign key (question_id) references ehr.questions (id)
            on delete cascade,
    constraint question_tag_ibfk_2
        foreign key (tag_id) references ehr.tags (id)
            on delete cascade
)
    comment '问题与标签关联表';

create index tag_id
    on question_tag (tag_id);

create table questions
(
    id           int auto_increment comment '问题ID'
        primary key,
    title        text                                  not null comment '问题标题',
    content      text                                  not null comment '问题内容',
    create_time  timestamp   default CURRENT_TIMESTAMP null comment '创建时间',
    author_id    int                                   null comment '提问者ID',
    symptom_tags text                                  null comment '症状标签（逗号分隔）',
    status       varchar(20) default 'published'       null comment '状态',
    source       varchar(20) default 'user'            null comment '来源（user/ai）',
    constraint questions_ibfk_1
        foreign key (author_id) references ehr.users (id)
            on delete set null
)
    comment '用户提问表';

create index author_id
    on questions (author_id);

create table tags
(
    id   int auto_increment comment '标签ID'
        primary key,
    name varchar(64) not null comment '标签名',
    type varchar(32) null comment '标签类型'
)
    comment '标签表';

create table users
(
    id              int auto_increment comment '用户ID'
        primary key,
    username        varchar(64)                           not null comment '用户名',
    password        varchar(128)                          not null comment '密码',
    email           varchar(128)                          null comment '邮箱',
    join_time       timestamp   default CURRENT_TIMESTAMP null comment '注册时间',
    signature       text                                  null comment '个性签名',
    role            varchar(20) default 'user'            null comment '角色',
    last_login_time timestamp                             null comment '上次登录时间',
    constraint username
        unique (username)
)
    comment '用户信息表';

