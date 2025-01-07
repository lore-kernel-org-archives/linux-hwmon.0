Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923981EE00D;
	Tue,  7 Jan 2025 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250333; cv=none; b=SzEYiEFlEyQ1a91JjAufKcaGzwLHlwtxU+YKJ7DjhcdvvyerOCVf9Qk4Y5sPQbNpo6myiaDV1+DRpUAwWcQxOJ5aME/OeQUd9Nop8MyFyKVA37L/lOe8XSB7+pakE81U3f6FBVZZWRODCqjEM/8vzHfmPSOhQGINIUtyrlw1Ohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250333; c=relaxed/simple;
	bh=uad2b0Tyq+IuQqorDhEM4sUX5uhjGZENHUz87Z12eF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K26xFGB5cEbmpG0VBSF6bSCG4PtBVCoXhEW6j44t0OPhuMc5klBEH4SkyYBlLvEt+W/oWXvn+LuDgKgJ5nPgWce4ononkq2/wYqcxLgImllL8BlXlJFAFE/NdyJbLGatOXBcFZm88ZAyOV4N3sQozF1x7S+oHhmqIF/r5CckEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YS8K05DN5z15NKl;
	Tue,  7 Jan 2025 19:41:40 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C2B61800CB;
	Tue,  7 Jan 2025 19:45:21 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 7 Jan 2025 19:45:21 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jan 2025 19:45:20 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 3/3] hwmon: (acpi_power_meter) Remove redundant 'sensors_valid' variable
Date: Tue, 7 Jan 2025 19:33:30 +0800
Message-ID: <20250107113330.7970-4-lihuisong@huawei.com>
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

The 'sensors_valid' in acpi_power_meter_resource structure is always '1'
after querying power once. The default value of this variable is zero which
just ensure user can query power successfully without any time requirement
at first time. We can get power and fill the 'sensors_last_updated' field
at probing phase to make sure that a valid value is returned to user at
first query within the sampling interval. Then this redundant variable can
be safely removed.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/hwmon/acpi_power_meter.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 594f7681d523..49bef3350439 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -85,7 +85,6 @@ struct acpi_power_meter_resource {
 	u64		cap;
 	u64		avg_interval;
 	bool		power_alarm;
-	int			sensors_valid;
 	unsigned long		sensors_last_updated;
 	struct sensor_device_attribute	sensors[NUM_SENSORS];
 	int			num_sensors;
@@ -316,15 +315,14 @@ static ssize_t set_trip(struct device *dev, struct device_attribute *devattr,
 }
 
 /* Power meter */
-static int update_meter(struct acpi_power_meter_resource *resource)
+static int update_meter(struct acpi_power_meter_resource *resource, bool check)
 {
 	unsigned long long data;
 	acpi_status status;
 	unsigned long local_jiffies = jiffies;
 
-	if (time_before(local_jiffies, resource->sensors_last_updated +
-			msecs_to_jiffies(resource->caps.sampling_time)) &&
-			resource->sensors_valid)
+	if (check && time_before(local_jiffies, resource->sensors_last_updated +
+			msecs_to_jiffies(resource->caps.sampling_time)))
 		return 0;
 
 	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_PMM",
@@ -336,7 +334,6 @@ static int update_meter(struct acpi_power_meter_resource *resource)
 	}
 
 	resource->power = data;
-	resource->sensors_valid = 1;
 	resource->sensors_last_updated = jiffies;
 	return 0;
 }
@@ -349,7 +346,7 @@ static ssize_t show_power(struct device *dev,
 	struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
 
 	mutex_lock(&resource->lock);
-	update_meter(resource);
+	update_meter(resource, true);
 	mutex_unlock(&resource->lock);
 
 	if (resource->power == UNKNOWN_POWER)
@@ -429,7 +426,7 @@ static ssize_t show_val(struct device *dev,
 			val = 0;
 		break;
 	case 6:
-		ret = update_meter(resource);
+		ret = update_meter(resource, true);
 		if (ret)
 			return ret;
 		/* need to update cap if not to support the notification. */
@@ -699,6 +696,10 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
 		return res;
 
 	if (resource->caps.flags & POWER_METER_CAN_MEASURE) {
+		res = update_meter(resource, false);
+		if (res)
+			goto error;
+
 		res = register_attrs(resource, meter_attrs);
 		if (res)
 			goto error;
@@ -898,7 +899,6 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	if (!resource)
 		return -ENOMEM;
 
-	resource->sensors_valid = 0;
 	resource->acpi_dev = device;
 	mutex_init(&resource->lock);
 	strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
-- 
2.22.0

