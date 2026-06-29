Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C936494C
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760671; cv=none; b=QnyRbm3rCN+LJ6V9xqT2zaC4KpsL3+rhsNWukrVONsvH7Ie3AcPyBYFbc7W71Ndkm0TjCn4VYMtyjY6vQyKKDXxpASsxDVLDmMQl5oETnGPS67DAwC6rr7uAUY9lXYLbqwqFEGk2aUTb6QblhgNR0kKNmATppqonpQ7BRI0272Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760671; c=relaxed/simple;
	bh=4KDJhI9HttGkLkq+uMNiUP4rjVMYobG2l//58bY3dbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLA74+hixZZwTA4Z5n+/GRhJ4UsvQnOx3JIsrY9QjEZ+/h0wgkITm29T+xNyO3GhDrsPTV+C735IFekmeyMGajRiUMGpeKZ8+WekWBo65F+aL+xQ3LJgf4hptbhG6OeHdq/ydxO40pMVvtpTjfZihnwwg3a0F9jWathELgneZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtTfcl6P; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtTfcl6P"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46cacc39191so981251f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 12:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760668; x=1783365468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFiE5okuY8pUtgILiSrSZWQvOisAuKWMlCokuO74NKY=;
        b=mtTfcl6PE1uHYxeOLf55qGrgz6+FfG8xpy7EgKGAIO6Ts5OI0SFI8BQoxGXtRMyOkv
         n8vHTZjRyLsRDC+X0g1oS8jA89R/OjSW0WMvPlCiTCA4SiZBMKsOe6UVXx/wJLxNm1tp
         +d5MeEWV319ZgIlt4fxJQVdF03uT3MJD8q8AWf0OwSmdAeJJz9iVZKlIxD0DI/XfvPfF
         No5zl+4M1Csh5mmh5vXGepsu9vK+LC9TM/hv75PC64oFXSlo+NSDp22qNDMtHqXHzq+u
         CrFMHvSJ86dGtnirBg/NHO2tnd3cUp01Q2GQ5ajHNc/uc0msBIwXP1h2cxv2FGm3ZJph
         bkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760668; x=1783365468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YFiE5okuY8pUtgILiSrSZWQvOisAuKWMlCokuO74NKY=;
        b=VlY7g/tLt4JrILHqdky+xfF07oNWRVLXduCHP/iMdqVWiWQyfoC8p69YEYAEufJYM/
         E1eY2yBpMWpbB5mnVvEzAvKhWfdk42bDtjOcXQi1/74MooJEw63psxGuKuV4fQQxgATR
         +ymp4J3zcjkjHhv5HZ6obGdW9nLmhZDTN+JrHrgIzJ17ZhQMkRtJ0UpK5b4kIKbTUSL1
         bG4XmHTq1pWVVTvnBg5nduIPIfZvLYJpaeDcE7T97ADmnyAqOcsiJXbSzAF1ojHd9hj1
         VfyaDdUaByYpHdWjIuwkFVo7k8EIiZIG5rJxaNSWwR/Xm6UvjxBbEb83FF+grwrDGQnH
         ApGg==
X-Gm-Message-State: AOJu0YwMxlLGGdyMpfBSZpFHHHqjxmZIO94kULpEvC5W1R+X2uGSL5cB
	sXuMM9JJ5rVY6lZE7HUDXbuapYvZH+HoMDmMru7KnRGwGG9kgkOvCI2isuemXw==
X-Gm-Gg: AfdE7ckOhJp66W9e/8+cLMZBSB7Fd9rV8D2MsApS8aaTP2cfIrLhVUQJDBcH9rKHbTy
	8u4CutQYp83TNI5CFehQLu5BCgu5owmhJudlApXyqqfzkpFebT1iyPnktW6GIeHe37A2zyYR7rd
	sZ+slVmpFvRJtIbQC0iSGQudFTxf3fedNWocGtxrRoyw4UPdEzkcmi8rEa+ltNSXcIB3D6i8MO9
	/UzniC0ute7trOubmBosdt2wPN/sMgxZkUl0cTsILz6SfpwV2xtvIF6wInkbNKEKoUB2OFjqlCC
	64v19nt/tVNBBTpf3qocKVE5EvARWr2dD1hD5XrzSeXR+94df/61fpnm9kOU71UgWHBhOGPZSrp
	y36QFfuYYWgDNi2y4UV+PQvzdcW5AQexaqxbxQb7Z+37IuAJ1iHd86yvFUFuSYEtysxOEUE3xKl
	Ex5i17LXBGiQcV4H7ApPVPF1YQ3Pj+eIOYJLVH137/OmJrxOcTNp9GAEG7BbQKvg37qehsRQyDY
	j9QnEBV3vB73+77XMu9+mdxN31ATfHOzL2J7StQt49NHQkk14MS2CkdI3n2HppvwSwF7JAYLhtB
	0IE8L19YSQ==
X-Received: by 2002:a05:6000:2c0c:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-4754a50ac5emr757082f8f.3.1782760668572;
        Mon, 29 Jun 2026 12:17:48 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cdccsm259568f8f.24.2026.06.29.12.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:17:48 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 29 Jun 2026 21:17:39 +0200
Subject: [PATCH 1/3] hwmon: (max1619) add missing 'select REGMAP' to
 Kconfig
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
In-Reply-To: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782760667; l=793;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=4KDJhI9HttGkLkq+uMNiUP4rjVMYobG2l//58bY3dbQ=;
 b=4LflAj63BV1nJl1FxlOGiLIMPdzdWeGL6ck6IgzOh4DqZkNcPwufL1uFSFGcJUfft0nUyPYAk
 5S7Bm/UJ0mqCyi49TFKpPNpgNlWhFq/wG3g4JMzBH439LctlQ8F8nFj
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Kconfig entry for the MAX1619 sensor doesn't contain a
`select REGMAP` parameter, causing build failures if regmap
isn't selected previously during the build process.

Fixes: f8016132ce49 ("hwmon: (max1619) Convert to use regmap")
Cc: stable@vger.kernel.org
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d3ff5fce8..a908e22bf166 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1248,6 +1248,7 @@ config SENSORS_MAX16065
 config SENSORS_MAX1619
 	tristate "Maxim MAX1619 sensor chip"
 	depends on I2C
+	select REGMAP
 	help
 	  If you say yes here you get support for MAX1619 sensor chip.
 

-- 
2.54.0

