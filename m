Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C83D5231
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148797; cv=none; b=lra6acz+rf58y2epmSgj7M3I6UdEy1ywLgvTFb7ErCTM8WsIDd0GFd1W5CYRdB7g0jkteigZ68viwAc5AoPibTKr66DOsZxGwNhVfAf9g4rU9yAbBWGXVpk2N4ond76MoTQZSr2tmtXNxxg+kzQmudMGFnNDO8BN7yu3Urp7qc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148797; c=relaxed/simple;
	bh=clTKCOBUcKKX0FwWohGCq2g/AFG/7UR6di+XJsvqHnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVA/7Z9eiK5L124nNhkQQomvLodgzMEZuu8/1SDTQxgKXqpo699462RACS0tFe7Zxq/m1+7DcMmxAAZHsYiC/TEHcifM+GuANADI/Er4JtnadOofydycrLV4TVFl2fGoY6kbEbSRY41fHvrFtRaqdN2VAaiECmv/kZqaMztqB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKGNBIjO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKGNBIjO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so234222b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148795; x=1778753595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYskE9BUqqox/U6JdrYHEc52UZOzahoWEH2vbpdJhlU=;
        b=TKGNBIjONMNP0LSBa/dxKnZ/ktefSaIxuPgquDuUwJnATZzzXtsAMFmoPiJ5gEfYF5
         1oep1r7aY2YbFTm7XE/Rk3oZYYLWFTOvjZtkOmfZYjUjdb/dqk4AdEofQa7aMgNDg2Dy
         Y7YD2nWFKDzKKAv7O7OBVZDTEnem3gHwp5hcTjXWiZkTZNwaQQPb84V9U4P9e1StNzom
         qrSPxtX+bhSgQS7aQUS9EcWD9aMDmZjFR94l97DcU9zkkQyFUk4ZyUeAwvykBzorv3eK
         abQZOU/9T41OqTV0EOcH4797hqbrIwK+hGRYbS3/wSx3jneY5MYAzsc4Lq9GODCFHpHe
         UoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148795; x=1778753595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYskE9BUqqox/U6JdrYHEc52UZOzahoWEH2vbpdJhlU=;
        b=Ko5h2THOPouXvnX0gExIIFI1xcPa7YCqsriWIw2abjkEuiLg++haWRuiEWer+9p/Ci
         wDkJ5+vtA3FnmPy9ROlyjsfyhJa0W7jtXyA0K9fjv4xVAg3IiAMlvS4LEdhDEegLG5FL
         6RNKaqZIJQMoaUwAnStiCs5RuFlDttkCO4mntmDVFxOjW19xVKgDjmbs7LEFAoeG0rm6
         /S8m+Z1rRkfKdKHPcQ0NZDkMVLU8R2mVH+ruUiBlintovASay0UJTegf6ryXiEg/KzUg
         tjXZZyYI5XZIaz1eNBXhcjhfcc2hj4ygrDy7ZtWS9m2dwDI57O47ZW1Zb18Unsigt96z
         5XoQ==
X-Gm-Message-State: AOJu0Yz7uAkff23VyvMbp+Lw5sW3v0Ihih+XvXzxfmL8zIDet0Fsrccb
	v736G65W/A0cJT5WD50SElAPPeTBwEJ5Pcbvb3qM/OuSIcKjB6e19kUg
X-Gm-Gg: AeBDiete/yefyXOa9qgmJDKiLKP5TS7nfPGu3SVcsgN5Zm5ddlLmOtqIZXBMmubkll2
	6iUSA/PBDKByVRlbQH0CJAhy2rf8hKqjjLcb291fuNns5fNDDPi+gn9mbD/jxy/xmQzGxclHBQZ
	SF/Vx8XiTvP+QZYvNaGZGhfiRVKUtHvdSbQ2xRBNqi5vxUN+QPYXDr43jvI+UAW8swOGk51haoN
	m9ek0Joc1lyK7wHJZC8O3SK+ZwNipwlBhEoTmEttpkxoBS4uSURGXv4OONfJi8eE9LY6q7CHJHp
	k5+6aOODKObyMcPv5BefnsgMo+DdfB6/n0FkRkNnE1Oo1/DqrFKsA4FEBZ/bw/1F2O9fMac9eCz
	miVAfORFikL6ILhwiiB2g1Q/6JhbwEngPbXF4REvcIAIwdCwbxrPngiCviCe2ue8FkNHeyi0XFN
	USFUymrtwsNlvJnJN+dspEfzAPsPp7kV3nLfD6qsQ8HcNj/b0xwDApld6+6bljx8fw/hPpk/TbA
	8OlByvZczBNgYSbMPSnFU0zpLYDdQ==
X-Received: by 2002:a05:6a00:6c95:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-83a5d3875a0mr6479595b3a.24.1778148794764;
        Thu, 07 May 2026 03:13:14 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:13:14 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 2/3] hwmon: lm93: Change unsigned to unsigned int for clarity
Date: Thu,  7 May 2026 15:41:42 +0530
Message-ID: <20260507101143.559475-3-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning by changing unsigned to unsigned int
for clarity and to follow latest kernel code style.
No functional changes are made.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/hwmon/lm93.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index c15e2a02dd86..1a3b5da924b2 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -339,7 +339,7 @@ static const unsigned long lm93_vin_val_max[16] = {
  * };
  */
 
-static unsigned LM93_IN_FROM_REG(int nr, u8 reg)
+static unsigned int LM93_IN_FROM_REG(int nr, u8 reg)
 {
 	const long uv_max = lm93_vin_val_max[nr] * 1000;
 	const long uv_min = lm93_vin_val_min[nr] * 1000;
@@ -355,7 +355,7 @@ static unsigned LM93_IN_FROM_REG(int nr, u8 reg)
  * IN: mV, limits determined by channel nr
  * REG: scaling determined by channel nr
  */
-static u8 LM93_IN_TO_REG(int nr, unsigned val)
+static u8 LM93_IN_TO_REG(int nr, unsigned int val)
 {
 	/* range limit */
 	const long mv = clamp_val(val,
@@ -379,7 +379,7 @@ static u8 LM93_IN_TO_REG(int nr, unsigned val)
 }
 
 /* vid in mV, upper == 0 indicates low limit, otherwise upper limit */
-static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
+static unsigned int LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
 {
 	const long uv_offset = upper ? (((reg >> 4 & 0x0f) + 1) * 12500) :
 				(((reg >> 0 & 0x0f) + 1) * -25000);
@@ -396,7 +396,7 @@ static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
  * upper also determines which nibble of the register is returned
  * (the other nibble will be 0x0)
  */
-static u8 LM93_IN_REL_TO_REG(unsigned val, int upper, int vid)
+static u8 LM93_IN_REL_TO_REG(unsigned int val, int upper, int vid)
 {
 	long uv_offset = vid * 1000 - val * 10000;
 
@@ -730,7 +730,7 @@ static u8 LM93_INTERVAL_TO_REG(long interval)
  * GPIO: 0-255, GPIO0 is LSB
  * REG: inverted
  */
-static unsigned LM93_GPI_FROM_REG(u8 reg)
+static unsigned int LM93_GPI_FROM_REG(u8 reg)
 {
 	return ~reg & 0xff;
 }
@@ -777,9 +777,9 @@ static unsigned LM93_GPI_FROM_REG(u8 reg)
 #define LM93_ALARM_TEMP2	0x20000000
 #define LM93_ALARM_TEMP3	0x40000000
 
-static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
+static unsigned int LM93_ALARMS_FROM_REG(struct block1_t b1)
 {
-	unsigned result;
+	unsigned int result;
 
 	result  = b1.host_status_2 & 0x3f;
 
-- 
2.54.0

