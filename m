Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F2215045;
	Thu,  9 Jan 2025 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736411345; cv=none; b=W5fKGbcg83OsTbSBADQAuBM2NPumig2CIH/x09EIusZQOue3x+yO/hM29cvrfN9Gdsr2U6DqbWB1Ficl2UgZrjd5VbeUeFgACxDoolbXrCpKEsdYjonKL529AbxzrpEPexd4IZxp6ZNX/MyrEWEjeXP7FOl/M8lMAIaeDvvYz5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736411345; c=relaxed/simple;
	bh=Kl5VtTQVJAo7scxlxFbvqounymHl6IQkxqF4P+VP+tA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vq0mX0sE/TBJbhCBPJbR8EJnrkICWG8+Gb0ZyBeHR/HRKTH09smIQEy5/9igiOqsmjIwMs+kef034XUSVN7ezKhwolZIrlxYFOTVGI4WDTFIGZmHDPMkDmLvHdjvwBioY0NKcvtgXTErDPFiNNAGy39ZYWv7QL1UtL8Mgw51QoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YTHws4m1vz1JGbZ;
	Thu,  9 Jan 2025 16:28:13 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id F3C9914013B;
	Thu,  9 Jan 2025 16:28:59 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 9 Jan 2025 16:28:59 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jan 2025 16:28:59 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v3 2/2] hwmon: (acpi_power_meter) Fix update the power trip points on failure
Date: Thu, 9 Jan 2025 16:17:08 +0800
Message-ID: <20250109081708.27366-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250109081708.27366-1-lihuisong@huawei.com>
References: <20250109081708.27366-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)

The power trip points maintained in local should not be updated when '_PTP'
method fails to evaluate.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/hwmon/acpi_power_meter.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index dcf86794485f..65de2cadfc60 100644
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

