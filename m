Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46943 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763711AbcINXGL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Sep 2016 19:06:11 -0400
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@zh-kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 07/17] SubmitChecklist: rename to RST and add to the development-proccess book
Date: Wed, 14 Sep 2016 20:05:52 -0300
Message-Id: <3955b817eeabc06c9088b4b59722c5e35c175e67.1473893776.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1473893776.git.mchehab@s-opensource.com>
References: <cover.1473893776.git.mchehab@s-opensource.com>
MIME-Version: 1.0
In-Reply-To: <cover.1473893776.git.mchehab@s-opensource.com>
References: <cover.1473893776.git.mchehab@s-opensource.com>
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add it to the development-process book, by renaming it to
SubmitChecklist.rst and move it to the development-process
directory.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 .../{SubmitChecklist => development-process/SubmitChecklist.rst}      | 2 +-
 Documentation/development-process/index.rst                           | 1 +
 Documentation/hwmon/submitting-patches                                | 2 +-
 Documentation/ja_JP/SubmitChecklist                                   | 4 ++--
 Documentation/ja_JP/SubmittingPatches                                 | 2 +-
 Documentation/zh_CN/SubmittingPatches                                 | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)
 rename Documentation/{SubmitChecklist => development-process/SubmitChecklist.rst} (98%)

diff --git a/Documentation/SubmitChecklist b/Documentation/development-process/SubmitChecklist.rst
similarity index 98%
rename from Documentation/SubmitChecklist
rename to Documentation/development-process/SubmitChecklist.rst
index cf8559d6166f..71ad93ffd9d6 100644
--- a/Documentation/SubmitChecklist
+++ b/Documentation/development-process/SubmitChecklist.rst
@@ -54,7 +54,7 @@ and elsewhere regarding submitting Linux kernel patches.
        but any one function that uses more than 512 bytes on the stack is a
        candidate for change.
 
-11: Include :ref:`kernel-doc <kernel_doc>` to document global  kernel APIs.
+11) Include :ref:`kernel-doc <kernel_doc>` to document global  kernel APIs.
     (Not required for static functions, but OK there also.) Use
     ``make htmldocs`` or ``make pdfdocs`` to check the
     :ref:`kernel-doc <kernel_doc>` and fix any issues.
diff --git a/Documentation/development-process/index.rst b/Documentation/development-process/index.rst
index 2c314a34c5f4..243041af82c3 100644
--- a/Documentation/development-process/index.rst
+++ b/Documentation/development-process/index.rst
@@ -18,5 +18,6 @@ Contents:
    stable_kernel_rules
    kernel-docs
    applying-patches
+   SubmitChecklist
 
    development-process
diff --git a/Documentation/hwmon/submitting-patches b/Documentation/hwmon/submitting-patches
index 371baf7a43e2..04b1036f07c4 100644
--- a/Documentation/hwmon/submitting-patches
+++ b/Documentation/hwmon/submitting-patches
@@ -10,7 +10,7 @@ increase the chances of your change being accepted.
 ----------
 
 * It should be unnecessary to mention, but please read and follow
-    Documentation/SubmitChecklist
+    Documentation/development-process/SubmitChecklist.rst
     Documentation/development-process/SubmittingDrivers.rst
     Documentation/development-process/SubmittingPatches.rst
     Documentation/development-process/CodingStyle.rst
diff --git a/Documentation/ja_JP/SubmitChecklist b/Documentation/ja_JP/SubmitChecklist
index c0020797d6b9..a8e88eebc346 100644
--- a/Documentation/ja_JP/SubmitChecklist
+++ b/Documentation/ja_JP/SubmitChecklist
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/SubmitChecklist into Japanese.
+This is a version of Documentation/development-process/SubmitChecklist.rst into Japanese.
 This document is maintained by Takenori Nagano <t-nagano@ah.jp.nec.com>
 and the JF Project team <http://www.linux.or.jp/JF/>.
 If you find any difference between this document and the original file
@@ -14,7 +14,7 @@ to update the original English file first.
 Last Updated: 2008/07/14
 ==================================
 これは、
-linux-2.6.26/Documentation/SubmitChecklist の和訳です。
+linux-2.6.26/Documentation/development-process/SubmitChecklist.rst の和訳です。
 
 翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
 翻訳日： 2008/07/14
diff --git a/Documentation/ja_JP/SubmittingPatches b/Documentation/ja_JP/SubmittingPatches
index aed86762a6d3..22dcc16b3b08 100644
--- a/Documentation/ja_JP/SubmittingPatches
+++ b/Documentation/ja_JP/SubmittingPatches
@@ -34,7 +34,7 @@ Linux カーネルに変更を加えたいと思っている個人又は会社
 おじけづかせることもあります。この文章はあなたの変更を大いに受け入れ
 てもらえやすくする提案を集めたものです。
 
-コードを投稿する前に、Documentation/SubmitChecklist の項目リストに目
+コードを投稿する前に、Documentation/development-process/SubmitChecklist.rst の項目リストに目
 を通してチェックしてください。もしあなたがドライバーを投稿しようとし
 ているなら、Documentation/development-process/SubmittingDrivers.rst にも目を通してください。
 
diff --git a/Documentation/zh_CN/SubmittingPatches b/Documentation/zh_CN/SubmittingPatches
index 8b93acb3a75e..97bc8639cbfc 100644
--- a/Documentation/zh_CN/SubmittingPatches
+++ b/Documentation/zh_CN/SubmittingPatches
@@ -30,7 +30,7 @@ Documentation/development-process/SubmittingPatches.rst 的中文翻译
 对于想要将改动提交到 Linux 内核的个人或者公司来说，如果不熟悉“规矩”，
 提交的流程会让人畏惧。本文档收集了一系列建议，这些建议可以大大的提高你
 的改动被接受的机会。
-阅读 Documentation/SubmitChecklist 来获得在提交代码前需要检查的项目的列
+阅读 Documentation/development-process/SubmitChecklist.rst 来获得在提交代码前需要检查的项目的列
 表。如果你在提交一个驱动程序，那么同时阅读一下
 Documentation/development-process/SubmittingDrivers.rst 。
 
-- 
2.7.4


