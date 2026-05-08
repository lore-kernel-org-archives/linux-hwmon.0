Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1354364046;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=Pax7XIRBT1AC5+dNBkOifjkN1IU69s5zAuNf1s6SoapmJQz3fzCECFTg3iI2kaKnnR4kn1+jMOPzFUrJ+ExzwgV2Scvta/xuSBrjGAs22lHy2zbqIDvz28TSxY1iLswRRBhPk9d9TeEMBfGqtdtd7he2cHf1KqUY007ziwpr5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=gIuFREtXSdo0yURYZ7Qg+gE1/pFmvMN1yO8A49M1xbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDkI0tLjw3/Nb//E1Pfyy64MZLB/v9k0/lEysdNrSL60FtD5hkaMm1cYFx2BPUGd4UyYHdPEAkl3z0kFoEELr3zDmp/Ey6OOB84lxvIhSovzeZETGXPm2YCj2RrcC9SYKJwSW+MVnF/G/u46+5ffSCoom1K5QEnokVtiae1VlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeNyDzF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeNyDzF9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62B72C2BCC9;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=gIuFREtXSdo0yURYZ7Qg+gE1/pFmvMN1yO8A49M1xbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XeNyDzF9Pk5YY9ijooPoIC4pMCp2oXdZl1tA0ir8lwo9eCaaBS0h6jQUTfsUXgelO
	 rKNnzfXSP2qFNvcNcUJ8aBB5G9RAho9/lRH1SK3kkmOurwzSkD6OEWxtBYb/OYojMa
	 9QdXE/O1gR9SX94I1nCdY5ffQNHRbpNjrgWL4bsyBJ3mj2B5jF0ZZeoIpVJQp6nDlA
	 ZpJtMHLseIxO4v9Pyn7WjUZuFmB9AgKzImeLacHCoYIak5OAdjlQ5QLIabMsn/krEz
	 fbYOA0rBdUesOizoeWxMA5oHPjQu45vKfEH4GguQufzg7OlgoTi1G0CbjBgQ6OJHHJ
	 71wMUZXMWA3Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F4ACD3445;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 08 May 2026 16:33:13 -0700
Subject: [PATCH 1/7] hwmon: (pmbus/adm1266) use wall-clock seconds for
 SET_RTC
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-adm1266-v1-1-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=ilxPiiB4ccinJ7vJjFyIeKd85ogX/E6EI9hbrqCCbB4=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZP4rOnyAdcas3bP+hx03nBD3QepsOosI999zO3wkl
 728phiwesvajlIWBjEuBlkxRZY5j/zftHW0RWyIOWQPM4eVCWQIAxenAEzkdAQjQ4vja+cQ87/y
 15yOGaqz/r9pWCoiP1N/5keWuW4eZ8PtrBgZdrRytZpE5vLOeyiRsUHL5/6MewknN6g1vjN8uZn
 7qME2NgCWJU2l
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

The ADM1266 RTC seeds the timestamp embedded in every blackbox record.
The driver currently sets it from ktime_get_seconds(), which returns
CLOCK_MONOTONIC seconds (i.e. seconds since boot). The intent of the
register, per the data sheet (Rev. D, "Setting UNIX Time Using
SET_RTC"), is the elapsed time since 1970-01-01 UTC.

As a result, blackbox records are stamped with "seconds since this
boot," making cross-reboot correlation against host syslog impossible
and making the timestamps in two records taken on different boots
non-comparable.

Switch to ktime_get_real_seconds() so the device is seeded with
wall-clock time, as the data sheet specifies. The internal RTC will
drift from this seed (the data sheet recommends periodic re-sync from
the host); a follow-up patch exposes the device via rtc_class so
standard userspace time-sync tooling can keep it aligned.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index d90f8f80be8e..a86666c73a5e 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -432,7 +432,7 @@ static int adm1266_set_rtc(struct adm1266_data *data)
 	char write_buf[6];
 	int i;
 
-	kt = ktime_get_seconds();
+	kt = ktime_get_real_seconds();
 
 	memset(write_buf, 0, sizeof(write_buf));
 

-- 
2.53.0


