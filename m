Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530019;
	b=m89RWOqR1lbds7zSm87I4GmpW4wiMrmObbSjBbEInL/OEYbFVyHCjTYp+4xJnkNLpIvd
	 gJJ4ocYyY9ZYrzxTFSRzA7n+ZQATUxysA8L04nbxtyg+Vw/rrZMQ7Y9ixfzWioumdX1nl
	 8LaoXdVjZPSDZBeHZVvVrZCd8yaC9H3jdeQIC/Xey6rSG4MosQQ1ReuYO+UWMB3Chzvjl
	 +LEfyjHMAycOMJne0FF1Va+OT11xgpGnLIyRq1kR/RpVGybPnfxx2aPQkcr0qzfQFEi/z
	 sXpA5wBk5+wO5CH+nZwJtt53vzx5KaAEluPPgYNXPLbpmoTSrICWUUjCUi9Lxm8NDiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7G9vF9OS16E0g31UX34geJPbbud9xS33YqrpYdPUMwo=;
	b=tvfynNFKSCe5rl26gwpNWyNqb68FjpcgqC8gljrV8ylbQniaBskpUa9ZZg2+uvFAmeSk
	 DN6MxOqD+oEqfSzbA+vO1k3LArSvAatbjTGM+/lXkDsf/+ZmsDg1iCL13XfITsODAE5o/
	 8HWUx/jqvlTCFy50xgMRewga7FRIuyF6M/QYQtXFZjPfEy5lDmwmJdnQzHfSU25eVDBUy
	 NOgFauMp5yG1Pd4U0lGOyt5Bn4OuR4GeZxrWV9BOm1MbhFyXmWgHMEyR/fyu1/m6Xujf4
	 gzGsUVDt3mZZwI1LZknHdQ2QY60dCiN9RgWxnwFbs59IJFswOi9dmGAVWG55rbFnAKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5NoKQzc;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBC606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDBC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5NoKQzc
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26845785e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 02:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530017; x=1794134817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7G9vF9OS16E0g31UX34geJPbbud9xS33YqrpYdPUMwo=;
        b=D5NoKQzcOhGbdR3DBrqW2mnxCLFInSyDjJH/+62YKTx0X38vQhc0vCYMBkzpHK6ymy
         ojU36Lg0xAj5NCCRLOLESGFqMcgx3+01OGf9fHep8bcKrI0/XANmkKByV4QuqjtGZBM+
         7vqshWMC8YbcujGmfcvqq6kI0L5EusmF8CfkQicmO/0vuyhAVoiCIo9170VnG0tWkyYS
         0z5dMP7QJKk0Ylbu6Wo04qPRi/l/f+1VYSgr49ZS60iRBTt6btidI0JBWNWQ0NrfBKpl
         jyI0O4p6VYliMAfJtARMbVyi2ggH6S8I8qE/omv1YL4NqENqwIEOn/dbWDS5jHItVOdF
         Mxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530017; x=1794134817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7G9vF9OS16E0g31UX34geJPbbud9xS33YqrpYdPUMwo=;
        b=LwB8N+IUWldBc9KCYxRh2mw4foetYLF/F9wQMsl4KktbCWu6w8wNFBEru7SeHNUmFo
         reBr2ZCzUurVgO7o2gMDKVzVUnCNYvScts8ygiSVocMBMTWKkHh6uUjxn4l9xKbN2Yys
         xtWGv751kAPeP5NslYUhBc9Y1z4AFq2poj/rxJNrSPmoViaaR2XBgksIemIKfYRzrT71
         mS0jofNWLeVXPGxZQpXNRb/EXjVpGJazYOgyVc1XwKbVUPvfr2cTT7dTw5muVJp8rymj
         lmyuURRUtxFx/mbw1uOZsVPo7V3WH7iNZ8hz1aqCoMkKW6Sflg2NJosvIDoyJMNouxs1
         i0zg==
X-Forwarded-Encrypted: i=1; AKwUvByRKA3XqTsTsdnANihRCh/wbmc0zhQjEMMjnfYVAkvx4Bnfhs8p6q3+Jdl1I3e9JzxMoqbbiOhXLMsHBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLE1lwcLTr8ewS5yJPgyKmoJUh8hyUJ7fA0TFNNfUUfYst8W7qV
	4uE9baqyXv+J/vWWsEuH075DRKLSZnJk88+T+aP9rL4eds5XB/zO01yL
X-Gm-Gg: AYBFou0/fLeezDDA9ncqEPfazhNKvaF2o+JC/9GlvjRm9oEygQZYo6uT+RWdH4crz5U
	QFJ9NQSsn6bHLQiDSVk7BXxyxCsb73vvcb/N2/XLCU7/nUkNtHw2mWUqyPI7KPp2vvPR/pF8JIz
	GloN6lCpfhZLweYvV4MmQOh7cDTl5kwOvCIQMkSCAODxlS9yLf4A4K02b9CRzilR6iLtX9hKeIl
	jrRodqJtOZ5g13P5030JQ5lkIfYjiF4hvcMXjveqfPwChsSgl+R39uLdqpUIei96BW4i9pjDfNI
	wkesgYLk2DHvh7tbp9RZc1Q/HTW0lQfrykD3MhkWkyhQ6wU4YAi/JFBitmVmkVnbm4RgrfFk1vH
	dmT/5wNpKrBt4zajqHso/IW6esM7AhzWl35WFCKw/iTJPn+MJQcR+NWE7E+AkRjzfPvJa9Co/NX
	0t8XjsZSgQO99KuM+b7VzU51neCdVNJWrLfA/lspCaI+NKDhEDZSJMNrQx2fCWYOX7MM2fKcw1E
	ETVxES0O9IjKS5Gy5VSp8k+2ShFmqISabG6quefTdJ+L3Nf2AtNDGG+yuitlnY6MqD9pdQDwfTU
	Wx6rbJoSDOKISythDjIXwdVF7fE=
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr168860485e9.16.1793530017002;
        Sun, 01 Nov 2026 02:46:57 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:46:56 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:41 +0300
Subject: [PATCH 1/7] platform/x86: asus-wmi: dump buffer replies in the
 debugfs dsts file
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-asus-fan-floors-v4-v1-1-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

Reading dsts calls asus_wmi_get_devstate(), which uses
asus_wmi_evaluate_method().  Because that helper handles only
ACPI_TYPE_INTEGER and leaves other return types zeroed, methods
returning an ACPI buffer read as 0x0.  This affects fan floor tables
(0x00110026, 0x00110027, 0x00110033), fan curve getters (0x00110024,
0x00110025), and TUF RGB readback (0x0010005B).

Evaluate the method through asus_wmi_evaluate_method_locked() directly,
matching the call node, which keeps execution serialized against other
WMI operations.  Format integer replies as before, dump buffer
contents with their byte length, and print any other type as t:<type>:

  DSTS(0x110026) = 16 bytes:
    00000000: 00 00 00 00 19 30 3a 4a 00 00 00 00 00 00 00 00

The sentinels 0xfffffffe and 0xffffffff continue to return -ENODEV.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 46 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21aa21..c55f469cb03dc 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5038,16 +5038,48 @@ struct asus_wmi_debugfs_node {
 static int show_dsts(struct seq_file *m, void *data)
 {
 	struct asus_wmi *asus = m->private;
-	int err;
-	u32 retval = -1;
+	struct bios_args args = {
+		.arg0 = asus->debug.dev_id,
+	};
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u32 retval;
+	int err = 0;
 
-	err = asus_wmi_get_devstate(asus, asus->debug.dev_id, &retval);
-	if (err < 0)
-		return err;
+	status = asus_wmi_evaluate_method_locked(asus->dsts_id, &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
 
-	seq_printf(m, "DSTS(%#x) = %#x\n", asus->debug.dev_id, retval);
+	obj = (union acpi_object *)output.pointer;
+	if (!obj)
+		return -ENODATA;
 
-	return 0;
+	switch (obj->type) {
+	case ACPI_TYPE_BUFFER:
+		seq_printf(m, "DSTS(%#x) = %u bytes:\n", asus->debug.dev_id,
+			   obj->buffer.length);
+		seq_hex_dump(m, "  ", DUMP_PREFIX_OFFSET, 16, 1,
+			     obj->buffer.pointer, obj->buffer.length, false);
+		break;
+	case ACPI_TYPE_INTEGER:
+		retval = (u32)obj->integer.value;
+		if (retval == ASUS_WMI_UNSUPPORTED_METHOD || retval == (u32)~0)
+			err = -ENODEV;
+		else
+			seq_printf(m, "DSTS(%#x) = %#x\n", asus->debug.dev_id,
+				   retval);
+		break;
+	default:
+		seq_printf(m, "DSTS(%#x) = t:%d\n", asus->debug.dev_id,
+			   obj->type);
+		break;
+	}
+
+	kfree(obj);
+
+	return err;
 }
 
 static int show_devs(struct seq_file *m, void *data)

-- 
2.56.0

