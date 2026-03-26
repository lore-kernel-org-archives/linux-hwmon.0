Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E439A7F6;
	Thu, 26 Mar 2026 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552967; cv=pass; b=iizARGYNJdGNMQzWP+oEc1rdLNQTFVFjQW2gMFDgfzJbp3ffaOw/gIuQBpNeHp/HGIsIZYj5A1pLgRCgyFMifacbMYC4tDom8sdM4TAYciBhSkXXVOQmEz5k5C/+iQvvLA+4WHlIMrMlwoJVUxNU9fW+jfX83lH6QxMx4eqe1ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552967; c=relaxed/simple;
	bh=XL88iy7BHhBsEEyA56+hg3U22V/liVvxCQTakKsbOFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hjjIuyUZK49aUDR8JsjGtRYYDes+AvtMPVzCBeEMmq00J8qBGuf1MlE6rzxR5QZIWRUpiknp69ou93n6PmljVFMsJL20hDRr+fqbtjekGAHUqpbg1jCHI4OPwTDo/yB3ANl47lyIvuNiUqllQpGEHsbOG7SOU8bZKbtrsPVWu5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=IXK4e328; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="IXK4e328"
ARC-Seal: i=1; a=rsa-sha256; t=1774552950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CQBucm9LvFzAZm6V04gJO4fJChQvUP593rvNblDNQqwkcAWI8rUejV66bW3DZKN+/Iam48E/H1atJo3ioRcfCZO+rWWuTs9HSgau9/nA1xRFrByv7x3y/I74zgd5pN8QaykUbkkVYSWwuV3ZZ/6baVGLsdobQ4VFCoJjgsHcRv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774552950; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5HBd70CTqm2cD5uQkmhrerSMpwmJp9KsG3MTUzotqFI=; 
	b=hiv1ZKCBp5u2H9nllWIi6oh8XWbK+qbxAq8VzrcYvCAHV+7at4jpL7BtPyw8iU7vrDYIZwrVCUN9OixzC2y39Y0OMTKi6DepvC2zwa+sak4zbkbhzZqalx5BXj6BPV5C72Zw/DaKE7rSx3nCIq+RxdflGyvA3dGYgu6WZ7MC4OA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774552950;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5HBd70CTqm2cD5uQkmhrerSMpwmJp9KsG3MTUzotqFI=;
	b=IXK4e328CwWYVIfTTkROC1ZVXhgJoR79V510qbJb2tJNVwNbBhalHbwrvSTEeJrD
	KEyrjnwl8ZxnxVyvHM8JGJQmf9vBNkOsXx6eZpYpInhKQp1N7ys1CwhQzsPfGIsuStz
	MzlbUNFlA/dklhQgBLIRtJ3tlpCOxb86Hi/bIdaUcY9s+MaUCU1j5+k5dzAW0PSrqVt
	2dO7eRczSLCc4julXxu5h5V5SEmkxsOeYKL55GWk5VhArWefQafbWpSJekj1J9BY4Ay
	XCKsH4yG1appEbgtBGzNcctXD5D0oYWMgFju3ORWrtoKoAOJ47x8wAgSZwLvcrQsi2z
	8rCAoaKbpg==
Received: by mx.zohomail.com with SMTPS id 17745529481030.9414414434306764;
	Thu, 26 Mar 2026 12:22:28 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 27 Mar 2026 03:19:50 +0800
Subject: [PATCH 1/4] hwmon: Add label support for 64-bit energy attributes
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-hwmon-witrn-v1-1-8d2f1896c045@rong.moe>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
In-Reply-To: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-ad80c
X-ZohoMailClient: External

Since commit 0bcd01f757bc ("hwmon: Introduce 64-bit energy attribute
support"), devices can report 64-bit energy values by selecting the
sensor type "energy64". However, such sensors can't report their labels
since is_string_attr() was not updated to match it.

Add label support for 64-bit energy attributes by updating
is_string_attr() to match hwmon_energy64 in addition to hwmon_energy.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/hwmon/hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9695dca62a7e..6812d1fd7c28 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -505,6 +505,7 @@ static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
 	       (type == hwmon_curr && attr == hwmon_curr_label) ||
 	       (type == hwmon_power && attr == hwmon_power_label) ||
 	       (type == hwmon_energy && attr == hwmon_energy_label) ||
+	       (type == hwmon_energy64 && attr == hwmon_energy_label) ||
 	       (type == hwmon_humidity && attr == hwmon_humidity_label) ||
 	       (type == hwmon_fan && attr == hwmon_fan_label);
 }

-- 
2.53.0

