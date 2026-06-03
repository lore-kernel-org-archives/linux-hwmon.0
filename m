Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8B34D92C
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495858; cv=none; b=C85uRa15uWbTaXcwp8PiELw/j/gfmt5pzbwJ/rkyWkLQGX4kFXWlUNeOqj3akWZqNg08An5SULgkFj5vL7zDSkssrMqUGpphFnsAZWFWkzZYl4drQmadOttFEG+0t/L9X5qaKHW62hCYl9uNgS6CMu01+8L88/e3IohH8b3zs7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495858; c=relaxed/simple;
	bh=X/4LDAMoKZkMh4PAm7f3Ytwubin99iyLxf77BzywFhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aSquEQyeoGErPb/8EXqfUGhAnBiQm88kl2iN0ggtFdkPSqECSPcrETq4V0Ovk/DI2UojmbnPu1T2R3uF+CSS6wM/c0I3bZdlH20aDjz0027KFDN0IruLIahxKhNEh/W5Fqge/DwfpbzuO+LFaFy8nZXeQAOZXkkjZtm/ye+xKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCzGHXlt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCzGHXlt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5318645f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495853; x=1781100653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6uE/yj6yBBMDcnhynVadW7yV5ZE49OrcbTpAkFxMBQ=;
        b=cCzGHXltWJofqlJrjzS4dqMoUCcdbCXPab9M4G+KJSnnLBQ0gahNaBps4Pz1zNFNCC
         a+u9B5gvLb6wzBQ8puonc8dTF8R19PPeoRLKL+U+gHldpN8XoZexH46AR1qtA8+6mU4j
         5A9pSFmekpc2xAZ+gpU/hM19ocMA8yPH9q/t1taIUJ0PuyJ6x8aj2twhTSofnhkDCWeK
         85WsA/WNfOHNhXIVggjAvzXcWigj6wwha43HQdOMpLLHN/3lVndm4snAb9KCApCGg9Y+
         letw/z0dVgOdIX8oCdcWfRz9ZVT4mOeJ+h2t5l7JjHFQlFXxAODTxbUSMtcFfGv52Azi
         HshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495853; x=1781100653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6uE/yj6yBBMDcnhynVadW7yV5ZE49OrcbTpAkFxMBQ=;
        b=plwdcodtpSoCVIitWv0erQq4jMEItHMiP+l/My2FYheZifySeZZ6BcsIuitqXSDXvy
         YYZgVwvk4rDey3RhCz7aX1Oa4iZ4mPye7LHXDryw31t7j/HeiK13gJ2XKuKoTBaJ0AR4
         gkEGww156/BWDnYj+Leg+m3gZ5IaZ8YPNWzAvXZFLy3nPFP8/jrsS/OdD78uBygPiw9r
         YyblJBUtUoz3x2AG+IB9eZFHn0mVPk6hB62qQ7prrwIA0Ll/GEf50fVk7C/LnREL05ga
         j5TdgkzFma0ZlIE6K9nItfP8BJ7Is0uCLAmg/kAi5uRiAyW1VbOwl3aNHKPO1aVJKXuM
         VklQ==
X-Gm-Message-State: AOJu0YzNifnWmSFd9LIyomBvHM8IYSSR7FchM0dMqSpBDSafg3a2+ufL
	0rAmF51iwPlIlcUTCLnHnzWu7LOYxJbhlTdnDbemZbG4gQSsKKXjnw6iAYjUlg==
X-Gm-Gg: Acq92OGcTrGi7Kzv4LzwZ5oAp2+kUhvsK506MT8ALC41FUEobmZqaPgrqn9La+BgA52
	rS7PcuSdJ2gEe+MUpDvqtkI1aj8F/7ZRil2xjmI+oD56qsQo3ZiA1z7H/AJ4zyaLnTdgnlFmcXi
	HN6gRewjQQRtcm5qRuSRCJNZcLBDupuTMCd5mqn7PdJdWAK4xoz/bUPCeZQOq5ao0AOiDUYnNhZ
	rTcXGqP3BgbyqAd2YrxdJ+QXbiqh5KA4YLkiGxeJJGqwxsBSs5AEBwnA0s7+lZSSmk9VuHoLeHG
	F+22haacTmPUuNmZ6gLM4RxDqM7q9Hb0SYGlM+Hf8Peu3bINeCNohCZs8VWzkaQ9fuT68MORttw
	DgVdtoLaXXiIfTGqEQmAG8tmtBnKuzl2MsJ4mzqbE9+VmrFi2YYkjEU0AHWsSBwy3vzlPSE0bCj
	eAqO1WqnauXNL/NcZ/BlTu7XJhkU4UaCftsg==
X-Received: by 2002:adf:f403:0:b0:460:2477:2284 with SMTP id ffacd0b85a97d-460247723f2mr2137513f8f.39.1780495852755;
        Wed, 03 Jun 2026 07:10:52 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] hwmon: emc1403: Convert to use OF bindings
Date: Wed,  3 Jun 2026 17:10:30 +0300
Message-ID: <20260603141033.111300-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document and add OF support to this LM90 compatible thermal sensor
family.

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/national,lm90.yaml         | 109 +++++++++++++-----
 drivers/hwmon/emc1403.c                       |  25 +++-
 2 files changed, 100 insertions(+), 34 deletions(-)

-- 
2.53.0

