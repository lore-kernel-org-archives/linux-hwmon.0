Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.ispras.ru ([83.149.199.45]:39848 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932838AbdABVuE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 2 Jan 2017 16:50:04 -0500
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: hwmon: w83781d: Unused sysfs group w83781d_group_other
Date: Tue,  3 Jan 2017 00:49:53 +0300
Message-Id: <1483393793-28724-1-git-send-email-khoroshilov@ispras.ru>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

w83781d.c contains a definition of sysfs group:

static const struct attribute_group w83781d_group_other = {
	.attrs = w83781d_attributes_other,
};

the only usage of which is:

static void w83781d_remove_files(struct device *dev)
{
	...
	sysfs_remove_group(&dev->kobj, &w83781d_group_other);
}

So, it seems the group should be either created in w83781d_create_files() or removed completely.
What do you think?

Found by Linux Driver Verification project (linuxtesting.org).

--
Alexey Khoroshilov
Linux Verification Center, ISPRAS
web: http://linuxtesting.org

