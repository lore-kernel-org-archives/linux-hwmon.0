Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C1322C63
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876597; cv=none; b=hwJXYwoEbgp8Fx3XWbK6MsXC9tktd2M6Ie25t0jPt3KghY0jWvbYaTx/FKM7CvhbPWYtil5COkojFMzZX21vre9PHMCXAJZgtHPTE+Ju2e4txXAlAhSWPxBfffK6n29icwiTYfM1yPv6OsUsSAyiYEV4VDFJF281sZiQJC0RKWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876597; c=relaxed/simple;
	bh=1io2b+cGCwpQfwdasxnweJ72z/V4NLyKD6KXX3X0ApQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EkzWqwYbou4uV6rvLRprVLzr9iUmNLGrcrSjensWdsJqgLtfbmYzJhCpmOJDbaEW3ZJQGdqFSyLYBCapz50/pzrm1pC0xCC4V9eUkYDovVe8PLRR9HLtLXi0de9d5L9hC+47aVPuJpRNkE8PJbcHCOjqq11ymNrJAHjOhpOIPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUeSR+dl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUeSR+dl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a07fac8aa1so32249035ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765876595; x=1766481395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUk1kM50n0Uxz+X4Sasil+Qsrm9+azMKZxJy1CXcwvQ=;
        b=ZUeSR+dlclzbXw4jbzgZ3I7HYN2U0tBuOd3TOZwB2171q+8enMz0vNin9nqU1BS9jY
         oY00xqnT5iq5Uy5sYTR3K8GmS+JlENhICIHRFe7D3ApTTf9wy4Emp7+X+PF4ifC+FKMS
         08lZpqrwFAtA8L8trtpDenvQdPeo/AdS1WW7Mddf2zP5k0h1bO/KuQoMZCoCiwLf8j6b
         1/kX10jIUN90G0Gkv5hDHielupo8lzZtuZBhlsB4Md9ztZlBOUtWgSRUIAA70D7t0c/u
         ELzV4ahK3sp4n2fFMSdZkTBRs/PC1MqhqJPoWoMfJC+Gum3b9h01cq00j0iSyo2JQor1
         h42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876595; x=1766481395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUk1kM50n0Uxz+X4Sasil+Qsrm9+azMKZxJy1CXcwvQ=;
        b=URuEw1jOopNIlI+pKDe9BjcpiLcxhf8tT/R+fMa0PMxfoLdnKjLXgjzsk2PGiqdICX
         1xPtO1fRQEcXJj6UZHEmUovl3aEqxSmbOknnU75eEqOx3uNFrFZU6iB+uRsldlqkp6cV
         byejjOc55wHbX0qMvaD+FkfU/G0oRvp4tVOX/x74AayV9PoBdB1R/xmMEzJ77PesXfad
         +6wE6HpNGu1V2qpFeLiKxzwUOuyrtZVQsUiCNT1xYnZrRfhx7XqElfbY2ZoLBO2QPmLn
         qVCsXIwNsxgGTxDbsOitIOa2xyLFH4XDJAgyMxaFHC4VwseIxpsqdgeS/inKqz7sj9BQ
         nmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzXgA331LUQeIaH1Y74L0pFrNmAYvKh3WNlxbzjyAZ1BBOjYsuVViVoXXwHE4crqfSekGuWB8xKeo5hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynT1UYv5X/sGdCf03CQEKiIRfxzbtVYwkymUUvZEopJRbXytNF
	svFOLBtXPMgttqy+RPvwuRr4uGcl1nH9UbWwVY8MgFnEMXQtGEuO03CS
X-Gm-Gg: AY/fxX4I55vIsW2+WwduQUXiuS6JESoMFjx6EhkmI0QjDYezlWvXOYrHMF2Qw3jE/qG
	3Sji5fwNfs5weaqwqpi4wrBrC6wElaM5PQ+jx+M8KdJe/CdYLhLEPryE1+8kzBqwvgH+vBZ94h7
	x6HnWy/WUaUxqVDEb+8X8K5BRVhJNyzfbUCFBRS8QCxPVCfClNDe8S/U820xMQfL1z7mkLcgPnz
	pWqTF6+Cs3IllfvxG/yLcZqsDD8fgPoo5xowXkQWJvCFZv9G17ycCR/Kr59vZmFuBE9sJI0v1Cq
	5/z1Xdkp6A3LxKhsAx2R8B8YV6bm053glj1zOrG5GY2FBVWzEwgfOo1nd4pL/hEGlHFt82FAxl4
	Cve6pgNL0bSrWEu+28D9M56+cb/N4W9ZEe/cr9L3UJX15OCa81bm0nvkO1BAzP0phY07FmiHSBM
	J5PW0RQCpzXZDjegqqtG4e1zMWOf9nHkXVrupaPVcCav8psHcqhVzzEhxB9BsJLeLymOvKtNQ=
X-Google-Smtp-Source: AGHT+IGcvtb7IJ+L808dDmiv7YL9MyFInQQcQQ78RD7Bqy08HKGO1TupLqENXqYdsVnBF5ZbUDBpgg==
X-Received: by 2002:a17:903:2281:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a0fe5a2192mr62892025ad.10.1765876595089;
        Tue, 16 Dec 2025 01:16:35 -0800 (PST)
Received: from JF.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d50f9fsm156470525ad.44.2025.12.16.01.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:16:34 -0800 (PST)
From: Jeff Lin <jefflin994697@gmail.com>
To: linux@roeck-us.net
Cc: jefflin994697@gmail.com,
	grantpeltier93@gmail.com,
	karanja99erick@gmail.com,
	chiang.brian@inventec.com,
	krzk@kernel.org,
	william@wkennington.com,
	tzungbi@kernel.org,
	thorsten.blum@linux.dev,
	ninad@linux.ibm.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon/pmbus: (isl68137) Add multiple-function pin for raa229141a
Date: Tue, 16 Dec 2025 17:16:17 +0800
Message-Id: <20251216091617.2581192-3-jefflin994697@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216091617.2581192-1-jefflin994697@gmail.com>
References: <20251216091617.2581192-1-jefflin994697@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to supporting PMBus-based current monitoring, the RAA229141A
also provides two multifunction pins(PIN44,PIN45) that can be used to
sense the input and output current of nearby devices.

Readings from these multifunction pins are not reported using the
standard PMBus direct or linear data formats. Instead, they must be
retrieved via the Renesas-specific Dicrect Memory Access(DMA)
command codes and scaled by a factor of 10.

Signed-off-by: Jeff Lin <jefflin994697@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 97b61836f53a..e60771614941 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -178,6 +178,33 @@ static const struct attribute_group *isl68137_attribute_groups[] = {
 	NULL,
 };
 
+#define RAA_READ_DMA_DATA 0xc5
+#define RAA_WRITE_DMA_ADDRESS 0xc7
+
+/* DMA address for input current in PIN44 and output current in PIN45 */
+static const unsigned char dma_address_in[] = { 0xD3, 0xE0 };
+static const unsigned char dma_address_out[] = { 0x42, 0xEE };
+static int read_val_route_by_dma(struct i2c_client *client, const char *addr)
+{
+	int ret;
+	/* Set up DMA address */
+	ret = i2c_smbus_write_i2c_block_data(client, RAA_WRITE_DMA_ADDRESS, 2, addr);
+
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Set DMA address failed for address 0x%02x 0x%02x\n", addr[0], addr[1]);
+		return ret;
+	}
+	/* Read DMA data */
+	u8 buf[2];
+
+	ret = i2c_smbus_read_i2c_block_data(client, RAA_READ_DMA_DATA, 2, buf);
+	if (ret < 0)
+		return ret;
+	u16 value = ((u16)buf[1]<<8) | buf[0];
+	return value;
+};
+
 static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 				     int phase, int reg)
 {
@@ -207,6 +234,12 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 			ret = clamp_val(temp, 0, 0xffff);
 		}
 		break;
+	case PMBUS_VIRT_READ_IIN:
+		ret = read_val_route_by_dma(client, dma_address_in);
+		break;
+	case PMBUS_VIRT_READ_IOUT:
+		ret = read_val_route_by_dma(client, dma_address_out);
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -408,6 +441,18 @@ static int isl68137_probe(struct i2c_client *client)
 		info->format[PSC_CURRENT_OUT] = linear;
 		info->format[PSC_POWER] = linear;
 		info->format[PSC_TEMPERATURE] = linear;
+		info->format[PSC_VIRT_CURRENT_IN] = direct,
+		info->format[PSC_VIRT_CURRENT_OUT] = direct,
+		/* DIRECT read format 10mA/LSB */
+		info->m[PSC_VIRT_CURRENT_IN] = 1,
+		info->b[PSC_VIRT_CURRENT_IN] = 0,
+		info->R[PSC_VIRT_CURRENT_IN] = 2,
+		/* DIRECT read format 10mA/LSB */
+		info->m[PSC_VIRT_CURRENT_OUT] = 1,
+		info->b[PSC_VIRT_CURRENT_OUT] = 0,
+		info->R[PSC_VIRT_CURRENT_OUT] = 2,
+		info->func[0] |= PMBUS_HAVE_VIRT_IIN;
+		info->func[0] |= PMBUS_HAVE_VIRT_IOUT;
 		info->pages = 2;
 		info->read_word_data = raa_dmpvr2_read_word_data;
 		info->write_word_data = raa_dmpvr2_write_word_data;
-- 
2.34.1

