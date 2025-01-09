Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EFA215048;
	Thu,  9 Jan 2025 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736411345; cv=none; b=bhnr4Okrrxk35hj+skGrBb6DvM4lqqHJGaoQs3r5db2RN9W1/c5UpCeQUISIHoDCEWyOT5cdkuyw8VTEGHajNjZX6KXqD+KFPHNX2WqlILZYZ8deyw0vrOimfCOhYgaZQOq0DEp1bU1ZPyRi53dnJXRnIrSFd3MrmKiQFQQ/Kw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736411345; c=relaxed/simple;
	bh=wizWSHy/iVjQwQVE4Sfp4eBT5JHepS+hyCX5AvCpKSQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tmF+Da4OtR7JAFz21rMZoT1xIWjoY6CuOHWySmlmmcHnQ2w05M7Sb2BhDqi6fhmUcWlnBWOloQ61sEhaxu5ROBw1jayCkRZIAn2pebZ6jWEmm67eOyRXv2vTPelpE9ZudhWCEcm2H/Pi/Jr+tigDpWVBp5EFAi+wcn/d94NDKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YTHtM34Mrz11Rvg;
	Thu,  9 Jan 2025 16:26:03 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id 3DC2A1800D1;
	Thu,  9 Jan 2025 16:28:59 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 9 Jan 2025 16:28:59 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jan 2025 16:28:58 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v3 0/2] two bugfixes for acpi power meter
Date: Thu, 9 Jan 2025 16:17:06 +0800
Message-ID: <20250109081708.27366-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
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

Two bugfixes for acpi power meter.

---
 - v3: drop the last patch and use dev_err_once to print as Guenter suggested. 
 - v2: get power alarm state and 'cap' value from notification.

Huisong Li (2):
  hwmon: (acpi_power_meter) Fix uninitialized variables
  hwmon: (acpi_power_meter) Fix update the power trip points on failure

 drivers/hwmon/acpi_power_meter.c | 39 ++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

-- 
2.22.0

