Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950613ED3A4
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298714; cv=none; b=T26tED1oeNcXI+iVV4i5O3cxZOEgCiHeVLNldJE9Jkxcbo0CKykwAJteQ5uRbMB5oDWIJFZhgYjxzGPR9bzxLi3FUByRuTQuNJm8e09y4edSY3hJfwoo5NtVoY4JQpnu/ZhxTP6lvuB3Unltp3AaQBknCADbsdDdIAX7CVolQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298714; c=relaxed/simple;
	bh=Vg4Zslqe7SjoCnFKmHm7qyuWAc7it1YKp5e/dkZrgNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JeJA3OI8FmiHNFGsk+4fNEHujc7eCYTqR/fF8IO3p5UqdLxvmVZWAtfNpXNPGojKSkIZbyokSBfabSeQdeYXmIHy+hEA0PZHr6rU60K6Uevj9n2lg/LN7X+CbEuL3rvNvE7SftQd/JcoDLmZ6FEOvt4sQibotu7FzD2AN6d2pds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HzLV9YI3; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HzLV9YI3"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12ddbe104ccso3689308c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779298712; x=1779903512; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2bO/S2M4ZO9tGObEW+TLEYBhi+U5tc3VfFtB+GMS2s=;
        b=HzLV9YI3ldsWt0LUxnPlBszZqRn9FB3PoNsBu1UDb+ehZ3shybL8vKZEwyEwrRXaRo
         2NdtE5ogyQiRRdc0p30HiJaDdo/O36+yrnbpa07GKmfqZkUtneOXZsMvi9e2cWRg2sMZ
         fehLeui0pBv2YCUjerp0lMzr+35PEwvM28MmtpNWGYThXV6kKIo1/MXIJHNIpeXHLsMA
         TvnqTxzTnbzgKrgx63gacXWqQlxcy4/PJL5tpNzwxf45RTnO/clTBcXngq59kUETS0r7
         tQPYGieN43wS6CsPYwDAIx7zFdmN1igoUw5GAxBQFweqkQ9OIImqam7g5U1/+M5qK8pp
         qXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779298712; x=1779903512;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2bO/S2M4ZO9tGObEW+TLEYBhi+U5tc3VfFtB+GMS2s=;
        b=Fo/O7Rit9mtsNPhvESrCgqqlxK66ey5Htq4TWxNLSbM6iZjd0Jb0PFn6SdmK2e5WRC
         5ZBcD7/OLtNpr3X+kowZiQh2RwpcaWyixcqFSBrLi2F5OBc38xywkS5GB66kx9mgr6q6
         +rhNIpLgMlnRLL4xpaO/X17BFCzErzNUEB3yTKj6iZ2+34NqPhC3sZguVHGrQwgSJCLx
         vHVrS6KfHs+y2fULsR+6NIrxkrDFOpyCIkb+cdDBvzHrsIye71Hi8Y0MoFB0jGU9qMHT
         Ja2yAGakrrLFkhYFxcf0UMdELmqrT9vXPEKvPwLGxEV8vs+/VFtWC0P1A6O9i0yb3ZHP
         aLtg==
X-Gm-Message-State: AOJu0Yzk8vBBKa47feUWagz3ekGolf2/uQb32NYcyfgiGlZnGfNrxKyY
	PPIro7ZTw2B5dD6nVBONvNPn8iEY6JhF+zFiaADsyvBsp/Mpq6EhiIIlVw/a5VZHqlc=
X-Gm-Gg: Acq92OHWM+YQ4Nl6X9hNwPeD7qIZQ2tux3N4JX93UI7UEPRcPmMwqE/TnwlaSX20DAr
	bJ1WhDG/XuMq+10DVN8ZBH1wG1st0Co2YWI+EddluNlicqwbJzVjkyUYBfXlCgWzISxYID0/oWU
	kGw6xR/KEfxdZZiyWujCLLPujUAbN+fcxYNLf24ZY4VMDExUy4PGW4PtRLbgeTUUc8u6L3M4BJT
	doazjGTxSTwTTxIxb3j+fb6Lnz0MRo2EibQ6On30LBW//bmu45Q10/Uvm/yKbMWo6lWi/nyveRj
	pGxHKOU0z3fY89QjMGhrQn04GDXXzxoB5OnC/zT9KZcdfhENOqeaDeieVOtrhg+fj02ACrYyG7P
	4GefqDUks1oeok3+VzQTjFKsq8rZ09auf7iPb1Jhmx9bErd/hJTeRd1kgqU6Hp2qhlNO+PYeDFq
	YwGNEvgIKdgztp6BryNfRy+w8fzqrsGBYVB9RM
X-Received: by 2002:a05:7022:62aa:b0:12d:ca31:f1b6 with SMTP id a92af1059eb24-1350441d726mr10921226c88.18.1779298711544;
        Wed, 20 May 2026 10:38:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm27316733c88.5.2026.05.20.10.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:38:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 20 May 2026 10:38:28 -0700
Subject: [PATCH] hwmon: (pmbus/adm1266) serialize firmware_revision debugfs
 read with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-adm1266-fwrev-fix-v1-1-8a78c94a53ef@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAJPxDWoC/yWMQQqDMBBFryKz7kASMFSvIi4SM7FTqErSVkFyd
 0ddvs9/b4dMiSlDW+2Q6M+Z50lAPyoYXm4aCTkIg1HGqtoodOGjjbUYV7lj5A2d0jo2nurm6UC
 8JZHMV7Prb84//6bhe4aglAOPDrV4dQAAAA==
X-Change-ID: 20260520-adm1266-fwrev-fix-a011f9be598a
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779298710; l=2357;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Vg4Zslqe7SjoCnFKmHm7qyuWAc7it1YKp5e/dkZrgNU=;
 b=1gbpnr1MpEB8jgGcRDRh/aaUKjUOrDgdQK3CjzNZG7iBt37KbIQmRmiCWtE5wUicRAW3lUa7S
 J/YLkLpPqQCCO652DccH0z22QE5TPy02ob8fVUEZrxyvaww3HfKsmbg
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_firmware_revision_read() backs the firmware_revision debugfs
entry and issues an i2c_smbus_read_block_data(client,
ADM1266_IC_DEVICE_REV, buf) without taking pmbus_lock.  pmbus_core
holds pmbus_lock around its own multi-transaction sequences
(notably the "set PAGE, then read paged register" pattern used by
hwmon attributes), so an unlocked debugfs reader can land between
a PAGE write and the subsequent paged read in another thread.
IC_DEVICE_REV itself is not paged, so it cannot corrupt PAGE in
flight, but the same defensive serialisation applied to the other
adm1266 direct-device accessors applies here: any direct device
access from outside pmbus_core should be ordered with respect to
pmbus_core's own.

Take pmbus_lock at the top of adm1266_firmware_revision_read()
via the scope-based guard(), matching the pattern just applied to
adm1266_state_read() and the GPIO/NVMEM accessors.

Fixes: 7c99762af5c1 ("hwmon: (pmbus/adm1266) add firmware_revision debugfs entry")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Assisted-by: Claude-Code:claude-opus-4-7
---
The previous "GPIO, NVMEM, and debugfs accessor fixes" series [1]
locked all the adm1266 direct-device accessors except this one,
which slipped through because firmware_revision was already in
hwmon-next when the fixes were written.  Same defensive-locking
reason as adm1266_state_read() got there; same Fixes: shape
(stable backport candidate against the original firmware_revision
patch).

[1] https://lore.kernel.org/r/20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai
---
 drivers/hwmon/pmbus/adm1266.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index aadca716fe7f..7f4dbc98d92a 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -359,6 +359,7 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
+	guard(pmbus_lock)(client);
 	ret = i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV, buf);
 	if (ret < 0)
 		return ret;

---
base-commit: 7e63dac55e2de42a7947613c01e3d3c0fb9c15fc
change-id: 20260520-adm1266-fwrev-fix-a011f9be598a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

