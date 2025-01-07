Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5021E3DCC;
	Tue,  7 Jan 2025 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251260; cv=none; b=jUNLV0tW5MWOL5RbT7ewTW4RW2LdrnwdRvJsC8EpieL4GEsjU4lXxVDFYENua3XmQtTOw6KbYWApCX8Qem4AZOa2ZlilxVjHIZfDvPLCJe7Stian55bwpf11GDcFePqDX8vNT0fdqTG2MQWWk+yo/tI7TB8Sm1a8me9vUyY2cb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251260; c=relaxed/simple;
	bh=xCWqeAQHI04mjLJkOPci40xum0sHWZ95xAE5hBndvzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FkDOm+u12QeVdAYiLtMwO9WOk/rsi47SBM4udQdQI6IBdx4CNu8kF8LcFHcAksNG6Ky/9gVBjzmtpCcgajaUzjtBQqYIpQV2GEeU03S721nuAiut50RCHe6C0JRcGp9B4C1d8uPcX9xbavwAcjDNG+F8mxWK1JMSGkPTEEYmtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YS8Km2JL1z1kxfL;
	Tue,  7 Jan 2025 19:42:20 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 52AB614011B;
	Tue,  7 Jan 2025 19:45:20 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 7 Jan 2025 19:45:20 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jan 2025 19:45:19 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 1/3] hwmon: (acpi_power_meter) Fix uninitialized variables
Date: Tue, 7 Jan 2025 19:33:28 +0800
Message-ID: <20250107113330.7970-2-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250107113330.7970-1-lihuisong@huawei.com>
References: <20250107113330.7970-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)

The 'power1_alarm' attribute uses the 'power' and 'cap' in the
acpi_power_meter_resource structure. Currently, these two fields are just
updated when user query 'power' and 'cap' attribute. If user directly query
the 'power1_alarm' attribute without queryng above two attributes, driver
will use uninitialized variables to judge.

So this patch adds the setting of alarm state and update 'cap' in the
notification callback and update 'power' and 'cap' if needed to show the
real alarm state.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/hwmon/acpi_power_meter.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 2f1c9d97ad21..0b337d4fb212 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -84,6 +84,7 @@ struct acpi_power_meter_resource {
 	u64		power;
 	u64		cap;
 	u64		avg_interval;
+	bool		power_alarm;
 	int			sensors_valid;
 	unsigned long		sensors_last_updated;
 	struct sensor_device_attribute	sensors[NUM_SENSORS];
@@ -396,6 +397,9 @@ static ssize_t show_val(struct device *dev,
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 	struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
 	u64 val = 0;
+	int ret;
+
+	guard(mutex)(&resource->lock);
 
 	switch (attr->index) {
 	case 0:
@@ -423,10 +427,17 @@ static ssize_t show_val(struct device *dev,
 			val = 0;
 		break;
 	case 6:
-		if (resource->power > resource->cap)
-			val = 1;
-		else
-			val = 0;
+		ret = update_meter(resource);
+		if (ret)
+			return ret;
+		/* need to update cap if not to support the notification. */
+		if (!(resource->caps.flags & POWER_METER_CAN_NOTIFY)) {
+			ret = update_cap(resource);
+			if (ret)
+				return ret;
+		}
+		val = resource->power_alarm || resource->power > resource->cap;
+		resource->power_alarm = resource->power > resource->cap ? true : false;
 		break;
 	case 7:
 	case 8:
@@ -847,12 +858,20 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
 		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
 		break;
 	case METER_NOTIFY_CAP:
+		mutex_lock(&resource->lock);
+		res = update_cap(resource);
+		if (res)
+			dev_err(&device->dev, "update cap failed when capping value is changed.\n");
+		mutex_unlock(&resource->lock);
 		sysfs_notify(&device->dev.kobj, NULL, POWER_CAP_NAME);
 		break;
 	case METER_NOTIFY_INTERVAL:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_AVG_INTERVAL_NAME);
 		break;
 	case METER_NOTIFY_CAPPING:
+		mutex_lock(&resource->lock);
+		resource->power_alarm = true;
+		mutex_unlock(&resource->lock);
 		sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);
 		dev_info(&device->dev, "Capping in progress.\n");
 		break;
-- 
2.22.0

