Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB421EB9EB;
	Tue,  7 Jan 2025 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250332; cv=none; b=S+TRkOCAz+CYl3XCKCbSK7sgTlbmwQJdCGYadQkFuyibONnijS51XR5nZL0PlzDN3VbJ73m+9eS1IProQoM7E7rXv4f0pi6EZhvZZ1Yx03OQWBjiwy+zYBkC5fGuOTOWxXyMr1g0ORL+KsftOlsecfkVm/csYXxKYI5PrCv9Owc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250332; c=relaxed/simple;
	bh=cdt27/DlHh8xaL901PmHQZFJmnT3eMuL4WJyTSc/Gug=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I2Cvkuoi+dnh5LS2kNv3YojRAS7Tcxmwex8u8JSsugeOzfyIwrrRT2ipJ8PG/zpxNEIQt4ul7MjVUlqFwpjhA772TZY4pqFS4H24tF4F9+zhxPK4a/uk7SIcmmNuLf/C06R/qFgA6b5iu0NzjR6/HiBedXe7D9xVhAwvoQ4S7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YS8Lf0dDyz22kfS;
	Tue,  7 Jan 2025 19:43:06 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 227961A0188;
	Tue,  7 Jan 2025 19:45:20 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 7 Jan 2025 19:45:19 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jan 2025 19:45:19 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<liuyonglong@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 0/3] some bugfix for acpi power meter
Date: Tue, 7 Jan 2025 19:33:27 +0800
Message-ID: <20250107113330.7970-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
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

I found some bugfix when I use this driver. And remove a redundant variable
by the way. 

Huisong Li (3):
  hwmon: (acpi_power_meter) Fix uninitialized variables
  hwmon: (acpi_power_meter) Fix update the power trip points on failure
  hwmon: (acpi_power_meter) Remove redundant 'sensors_valid' variable

 drivers/hwmon/acpi_power_meter.c | 55 ++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 17 deletions(-)

-- 
2.22.0

