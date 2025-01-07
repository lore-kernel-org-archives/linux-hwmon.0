Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76181EE01F;
	Tue,  7 Jan 2025 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250328; cv=none; b=AHO807E3lwKmN73FHYlfjUX8HBjH0vNd1B0si2GwvAx/P4Bj+Ej7lDf2aWIummf02iMuYqVuRwNyV1DgtWWG5Mf1Ldbhd9PHZ4mcRiIP9jxwydoExHtg+0cnQg8j3G5551ujJmQA2GMcPvqOg8zOLEjYOF5yC1fOBITTX+RVYFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250328; c=relaxed/simple;
	bh=bjSbK1/dcaOyUEPT9A1nk7BF/nXc7j7ppdKyUA2GeWY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGqeGIUJ5QDl0SS1oTCLD4VsuJSXsqT+aRBisHyRX0pd4gw53YJNWECJD20y4zf/WYW7GhwONcb7n+bf6hfnf7Zc67z3MsOgpKQ0X1u9N0bIwu3Yvq6uuQK4NpC33boCYH7PmOlZvZ9Rhy0c6IiCd4xNSVrJ7j1s5llACF1jxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YS8K00FCMzxWt9;
	Tue,  7 Jan 2025 19:41:40 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id DAB231800CB;
	Tue,  7 Jan 2025 19:45:20 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 7 Jan 2025 19:45:20 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jan 2025 19:45:20 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 2/3] hwmon: (acpi_power_meter) Fix update the power trip points on failure
Date: Tue, 7 Jan 2025 19:33:29 +0800
Message-ID: <20250107113330.7970-3-lihuisong@huawei.com>
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

The power trip points maintained in local should not be updated when '_PTP'
method fails to evaluate.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/hwmon/acpi_power_meter.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 0b337d4fb212..594f7681d523 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -293,8 +293,8 @@ static ssize_t set_trip(struct device *dev, struct device_attribute *devattr,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 	struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
+	unsigned long temp, trip_bk;
 	int res;
-	unsigned long temp;
 
 	res = kstrtoul(buf, 10, &temp);
 	if (res)
@@ -302,13 +302,15 @@ static ssize_t set_trip(struct device *dev, struct device_attribute *devattr,
 
 	temp = DIV_ROUND_CLOSEST(temp, 1000);
 
-	mutex_lock(&resource->lock);
+	guard(mutex)(&resource->lock);
+
+	trip_bk = resource->trip[attr->index - 7];
 	resource->trip[attr->index - 7] = temp;
 	res = set_acpi_trip(resource);
-	mutex_unlock(&resource->lock);
-
-	if (res)
+	if (res) {
+		resource->trip[attr->index - 7] = trip_bk;
 		return res;
+	}
 
 	return count;
 }
-- 
2.22.0

