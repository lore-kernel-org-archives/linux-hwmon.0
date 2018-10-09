Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44835 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbeJJBo2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Oct 2018 21:44:28 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org, mingo@redhat.com
Subject: [PATCH] hwmon: (core) Add trace events to _attr_show/store functions
Date: Tue,  9 Oct 2018 11:26:02 -0700
Message-Id: <20181009182602.3085-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Trace events are useful for people who collect data from the
ftrace output. This patch adds initial trace events for the
hwmon core. To call hwmon_attr_base() for aligned attr index
numbers, this patch also moves the function upward.

Ftrace outputs:
 ...: hwmon_attr_show_string: index=2, attr_name=in2_label, val=VDD_5V
 ...: hwmon_attr_show: index=2, attr_name=in2_input, val=5112
 ...: hwmon_attr_show: index=2, attr_name=curr2_input, val=440

Note that the _attr_show and _attr_store functions are tied
to the _with_info API. So a hwmon driver requiring the trace
events feature should use _with_info API to register a hwmon
device.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 MAINTAINERS                  |  1 +
 drivers/hwmon/hwmon.c        | 27 ++++++++++----
 include/trace/events/hwmon.h | 71 ++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 7 deletions(-)
 create mode 100644 include/trace/events/hwmon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1640b9faa75e..589b32405bf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6461,6 +6461,7 @@ F:	Documentation/devicetree/bindings/hwmon/
 F:	Documentation/hwmon/
 F:	drivers/hwmon/
 F:	include/linux/hwmon*.h
+F:	include/trace/events/hwmon*.h
 
 HARDWARE RANDOM NUMBER GENERATOR CORE
 M:	Matt Mackall <mpm@selenic.com>
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index ac1cdf88840f..975c95169884 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -24,6 +24,9 @@
 #include <linux/string.h>
 #include <linux/thermal.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/hwmon.h>
+
 #define HWMON_ID_PREFIX "hwmon"
 #define HWMON_ID_FORMAT HWMON_ID_PREFIX "%d"
 
@@ -171,6 +174,13 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 }
 #endif /* IS_REACHABLE(CONFIG_THERMAL) && ... */
 
+static int hwmon_attr_base(enum hwmon_sensor_types type)
+{
+	if (type == hwmon_in)
+		return 0;
+	return 1;
+}
+
 /* sysfs attribute management */
 
 static ssize_t hwmon_attr_show(struct device *dev,
@@ -185,6 +195,9 @@ static ssize_t hwmon_attr_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
+	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
+			      hattr->name, val);
+
 	return sprintf(buf, "%ld\n", val);
 }
 
@@ -193,6 +206,7 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
 				      char *buf)
 {
 	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	enum hwmon_sensor_types type = hattr->type;
 	const char *s;
 	int ret;
 
@@ -201,6 +215,9 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
 	if (ret < 0)
 		return ret;
 
+	trace_hwmon_attr_show_string(hattr->index + hwmon_attr_base(type),
+				     hattr->name, s);
+
 	return sprintf(buf, "%s\n", s);
 }
 
@@ -221,16 +238,12 @@ static ssize_t hwmon_attr_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
+	trace_hwmon_attr_store(hattr->index + hwmon_attr_base(hattr->type),
+			       hattr->name, val);
+
 	return count;
 }
 
-static int hwmon_attr_base(enum hwmon_sensor_types type)
-{
-	if (type == hwmon_in)
-		return 0;
-	return 1;
-}
-
 static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
 {
 	return (type == hwmon_temp && attr == hwmon_temp_label) ||
diff --git a/include/trace/events/hwmon.h b/include/trace/events/hwmon.h
new file mode 100644
index 000000000000..d7a1d0ffb679
--- /dev/null
+++ b/include/trace/events/hwmon.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM hwmon
+
+#if !defined(_TRACE_HWMON_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HWMON_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(hwmon_attr_class,
+
+	TP_PROTO(int index, const char *attr_name, long val),
+
+	TP_ARGS(index, attr_name, val),
+
+	TP_STRUCT__entry(
+		__field(int, index)
+		__string(attr_name, attr_name)
+		__field(long, val)
+	),
+
+	TP_fast_assign(
+		__entry->index = index;
+		__assign_str(attr_name, attr_name);
+		__entry->val = val;
+	),
+
+	TP_printk("index=%d, attr_name=%s, val=%ld",
+		  __entry->index,  __get_str(attr_name), __entry->val)
+);
+
+DEFINE_EVENT(hwmon_attr_class, hwmon_attr_show,
+
+	TP_PROTO(int index, const char *attr_name, long val),
+
+	TP_ARGS(index, attr_name, val)
+);
+
+DEFINE_EVENT(hwmon_attr_class, hwmon_attr_store,
+
+	TP_PROTO(int index, const char *attr_name, long val),
+
+	TP_ARGS(index, attr_name, val)
+);
+
+TRACE_EVENT(hwmon_attr_show_string,
+
+	TP_PROTO(int index, const char *attr_name, const char *s),
+
+	TP_ARGS(index, attr_name, s),
+
+	TP_STRUCT__entry(
+		__field(int, index)
+		__string(attr_name, attr_name)
+		__string(label, s)
+	),
+
+	TP_fast_assign(
+		__entry->index = index;
+		__assign_str(attr_name, attr_name);
+		__assign_str(label, s);
+	),
+
+	TP_printk("index=%d, attr_name=%s, val=%s",
+		  __entry->index, __get_str(attr_name), __get_str(label))
+);
+
+#endif /* _TRACE_HWMON_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.17.1
