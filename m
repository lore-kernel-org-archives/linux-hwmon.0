Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB52F28EA
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356074; cv=none; b=JMiPGLxTcLMvQIDCSIseXU53L5BGGv0UawPYGln0Hgz+Q0ox85IrUix6Dygry19w4iEfUA9uha8kq1ui4ywBIPwsLHCuUOecubmVATRxczHsEUj2B+eO0tWETbIM0OkKSmby56yRTsXrEWTmg9v0pz+7IaRQe/gLXI0n4oGHM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356074; c=relaxed/simple;
	bh=RajUQXmvQE08sa33cO/1vwenqAM0U8FH5bivJhhJeJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJY6hCZHLg7aL7/P9BvVD57hd1U8BfheGGnruQPbp5k1SNUHW1zukvNNZnVJ7OcjdbCqfZryumEdpL8qgXtlgchX+Zb0YzE48VTVn3VNTRzvhsdOsZlGatOIeMviLo6dzjrU3reMhx7KvdLDlqSdnueYEZGtvUE9Oa8kWnkcQUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSETMMXM; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSETMMXM"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c5320536bfso11852685a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 18:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356072; x=1768960872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RajUQXmvQE08sa33cO/1vwenqAM0U8FH5bivJhhJeJM=;
        b=hSETMMXM9r/OttE0FFTKXawMQ/UVMBWYb3lC4VeXuCxy/sl0QBuzgPXZTWxgiiUwOI
         s4Suce7jTP1LTmtmmMNK4EYRARCzgySLbBWn0E9zv8fhIeHrPa9qM+bar1pJiW0UdEAe
         9TJzco5T2gELKXTtRy8TQ5Y0xi8S5Tw5SakZMm8YauLn1hmSZS5dZXo9DMPNP9D4+iDD
         8bIohXlfAKPrqRzQTrUYAmI9geeTVqydfGDp/95L7lTKOhj72DUqqY09IZ3TfPFoiks+
         swGxXUyNkp84VnUcppMNXeq369gbpue/5fpN2KrNUxZuJa7Jy+NfqYm9qTPfNFO75JVv
         ppJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356072; x=1768960872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RajUQXmvQE08sa33cO/1vwenqAM0U8FH5bivJhhJeJM=;
        b=r+xZhjLtEPE0CsVKIbXS5xiqVFpkXhNwPTQACXeC2bxIJwU83STMdQMPZv4N7tkPkT
         CAy0cgdsOTwyEC3ba2/HlikAzhFiF5q2pjwPZj36yGuFx2HXVWNeePzqukop8YKpA8IT
         X+33ayIW/VpB0aGzkMID34sxxYabRRnaaljUXfFujb56RyyEopcOloiK6EmukTPnmkwV
         svF8UBAj86UsnxFbjW+Ja8n4clTtgQG4HSFd6F/JpfzlStS/Um7g/5aG0u005i2kHkJR
         Ic/u2vwoOz+LCGkj86ktbxa1RvrT3w2KBWD2ToLggONufP7Z6wcnsff0hr9R3tHx8+6f
         JIEw==
X-Forwarded-Encrypted: i=1; AJvYcCWolHAn4m805xXit0dlQCLqf+Jh0sIfpqAJssv1DoSKIDjAZvho5hFfXHLdKq38rQ6v6zh8nqqvUWWrrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/2S63XZFWby9SO4N2ZgJnrC9Ys8hCfeP8SChabimaZ/PXCeM
	hA1tLbPNdi+pFb3PRbYbYqEaYQJGiA08UvfsDF06fWRDcdZaguIafGrfQ1/Lug==
X-Gm-Gg: AY/fxX5szk+MQp9PeCOlmX3GlK+4U9Ya/lRwiulH+BYMZgc30gjvFHoLq+4puDV/EWx
	Lo15ZyKku6NS5ybnfX230zuCJZ4JSZdzVaB73IulZRBEr2cXHKybCLyKwqVVOOKSKGPsinWPX5y
	d69FjSCUxJj6PIfCtChLAR/zmt1WWF1nAIZxqCxB/3GyE76EZDXZ1cAxNL9len1Y/iTxqLMByqH
	UtGQ5L/I/wcdrnFOXaSnz8CVEqpku5RN9Iw4GYY2OLqIfzfSoRlDxk/5P/RQiUVWp2ZAc+8amWI
	IDPNU5U+9Cr2+tf2BHT0JqXh7Uu6cK0+1m9I4kOcieVqxgxmSi7255lkWn0PqFZLOILnmueIdfM
	cdyLYg1tCIVdNO7zjgRbRh/indmcXsgiyMCNcd41SnO0e3tOxBkijfUlmPABn1074cJ7tRhm0oU
	o7BZcQE/YNsZ58gex+PUgc
X-Received: by 2002:a05:620a:2549:b0:8b2:5649:25ef with SMTP id af79cd13be357-8c52fb399a0mr174929885a.21.1768356072346;
        Tue, 13 Jan 2026 18:01:12 -0800 (PST)
Received: from melody.ht.home ([2607:fa49:2104:2e00::983c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b792d4sm58495685a.25.2026.01.13.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:01:11 -0800 (PST)
From: leobannocloutier@gmail.com
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
Date: Tue, 13 Jan 2026 21:00:34 -0500
Message-ID: <20260114020108.83288-1-leobannocloutier@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The fans on my personal laptop were working fine, but after upgrading the whole
system (kernel upgraded from 6.17.8 to 6.18.4), the fans would spin at maximum
speed whenever plugged. Copying and adapting the whitelist entry for the Dell
G15 5511 seems to correctly enable automatic fan control for my laptop.
