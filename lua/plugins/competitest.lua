-- 专用于 competitest.nvim 的配置 (C++ 专注)

-- 推荐的 C++ 编译参数 (包含调试和警告)
-- -std=c++17: 使用 C++17 标准 (可改为 c++14, c++20)
-- -O2: 优化级别2
-- -Wall -Wextra: 显示所有常用和额外警告
-- -fsanitize=address -fsanitize=undefined: 运行时内存和未定义行为检查 (调试时非常有帮助!)
-- -D_GLIBCXX_DEBUG: 开启 GNU C++ 库的调试模式 (会变慢，但能检查更多 STL 错误，比赛时可能需去掉)
local cpp_flags = {
  "-std=c++20",
  "-O2",
  "-Wall",
  "-Wextra",
  "-fsanitize=address",
  "-fsanitize=undefined",
  "-D_GLIBCXX_DEBUG", -- 比赛提交时考虑移除这个和 sanitize 标志以获得最佳性能
  "$(FNAME)",         -- 输入源文件名
  "-o",
  "$(FNOEXT)"         -- 输出可执行文件 (无后缀)
}

-- 你的 C++ 模板文件路径 (如果不需要，可以注释掉 template_file 那行)
local cpp_template_path = vim.fn.expand("~/Algorithms/AlgorithmsTemplates/template.cpp")

require('competitest').setup {
  -- [[ C++ 核心配置 ]]
  compile_command = {
    cpp = { exec = "g++", args = cpp_flags },
  },
  run_command = {
    cpp = { exec = "./$(FNOEXT)" }, -- 运行编译好的可执行文件
  },

  -- [[ 测试用例管理 ]]
  testcases_directory = "_testcases", -- 测试用例存放目录 (相对路径)，用下划线开头可以稍微隐藏
  testcases_use_single_file = false,  -- 使用多个文本文件存储测试用例 (in1.txt, ans1.txt ...)
  testcases_auto_detect_storage = true, -- 自动检测存储方式
  -- 自定义测试用例文件名格式 (可选，默认格式通常够用)
  -- testcases_input_file_format = "in_$(TCNUM).txt",
  -- testcases_output_file_format = "ans_$(TCNUM).txt",

  -- [[ Competitive Companion 集成 ]]
  companion_port = 27121, -- !! 必须和浏览器插件设置的端口一致 !!
  receive_print_message = true, -- 接收时显示提示信息
  start_receiving_persistently_on_setup = true, -- <<< 添加了这一行！让插件启动时就监听端口

  -- [[ 代码模板 (仅 C++) ]]
  template_file = {
      cpp = cpp_template_path, -- 指定 C++ 的模板文件
  },
  evaluate_template_modifiers = true, -- 允许在模板文件中使用 $(PROBLEM), $(CONTEST) 等变量

  -- [[ 接收文件路径配置 ]]
  -- 指定接收单个问题时的文件路径和名称
  -- $(JUDGE), $(CONTEST), $(PROBLEM) 是从 CC 获取的信息, $(FEXT) 是文件后缀 (这里会是 cpp)
  received_problems_path = vim.fn.expand("~") .. "/CP/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
  received_problems_prompt_path = false, -- 接收单个问题时不提示路径确认
  -- 指定接收整个比赛时的目录结构
  received_contests_directory = vim.fn.expand("~") .. "/CP/$(JUDGE)/$(CONTEST)",
  received_contests_problems_path = "$(PROBLEM)/$(PROBLEM).$(FEXT)", -- 每个问题放一个子目录
  received_contests_prompt_directory = false, -- 接收比赛时不提示目录确认
  received_contests_prompt_extension = false, -- 接收比赛时不提示文件后缀确认 (自动用 cpp)
  received_files_extension = "cpp", -- 默认接收的文件后缀为 cpp
  open_received_problems = true, -- 接收后自动打开文件

  -- [[ UI 和行为 ]]
  save_current_file = true,    -- 运行测试前自动保存当前文件
  floating_border = "rounded", -- 浮动窗口使用圆角边框
  runner_ui = {
    interface = "popup",       -- 使用浮动窗口显示测试结果 (可选 "split")
    mappings = {               -- 你可以在这里自定义 runner 界面的快捷键
        -- 默认快捷键通常够用，可参考 README 自定义
    },
  },
  multiple_testing = -1,       -- 自动决定并发测试数量 (充分利用 CPU)
  maximum_time = 3000,         -- 单个测试用例最大运行时间 (3000ms = 3s)
  output_compare_method = "squish", -- 比较输出时忽略多余空格和换行 (对 CP 很实用)
  view_output_diff = true,     -- 在输出窗口默认显示 diff
}

print("Competitest C++ configuration loaded with persistent receive!") -- 修改确认信息
