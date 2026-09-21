Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AA638F25A
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973852; cv=none; b=lZmaxVYSZgDJGSCmf95uvtEV7uXirFHO7r5NNrWnQTbsSIcu9CBm/LGr9l8wq+16biXKMLyls5TZgYzm/DvHS3PXEOW0Oe+Poal9nh4VZnV9djynE5QpvL2eE5Ml4sbjWbAMvwaBSMaK+g18gB6sHQHQkcQNSU3lZfMKQMnz/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973852; c=relaxed/simple;
	bh=ux5Y/3LCQzHxHZau9PhawOjE/YHeuznlELaCm+TSCwk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SoCh192M8LsJwQrpmmLdqLfbXlksM3cthtBEhz7i9udoYnCJswmB16kKouTR6oEPn6ritYLBJS1x79KyxHxzT0FLBQYJV7lPgU8TGPiaC8rAPntTgHe0hzb8wZLRdmq+HPgMuv4AUblj4EUJyGvDtuYFlrT6MxTmw4DPSZtWwtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zk0bEVTE; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zk0bEVTE"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so2421325b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2026 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973848; x=1790578648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AgD1qeUlj6w+/Yc9BcfnzKrqeR+7yBEE6KB5pQOTKC8=;
        b=Zk0bEVTEGe9OAtTQBt5gmrN50gWiuTqWGwuc1229LaxuXUaHqY3450iK44FR441Cy5
         U/1iX6Al4eJLqdb9Ud8fWjtVwDnUCMb3XLq4PKyRHtPFR/76gw9Gt1is7f2yhAKNElW0
         Oh68tsHWJ6nawy+oj7zlv2MW4wnG1TBFOSvrRHHRdVTHJgUvcXwrOJfGtFYZ62MZ2wSF
         FKFtl6tn4oLbomdn7mrS2YilvPYkct1vJlaDYAqzLklJ2DnCUp3ZSFI+uTBZMIMSIeME
         h+j4TzvNMAscj6Vhagn4oGvaTqaSgk8A+0vrsW/CDrvgzBIckx5jwbfsPxf+jm+wbiLn
         L/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973848; x=1790578648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgD1qeUlj6w+/Yc9BcfnzKrqeR+7yBEE6KB5pQOTKC8=;
        b=Y/naTf1kkIaAZotnxYgtsmLjXv3S2F2I8iqMTlTVUymolUYIqREc7QyfBv2xR3dH5y
         1l6adMmXBf5NjT44VlAYTL0zJonF2HPGx+GK7sYHMAXwTYOjUHRBSGE8ZOwTGZsEfXLp
         7xi5cnY8bO0aKFYUeoxaTn35OaNyMwflJyjjNFV5dHazYOI0mdIPhmhIxQdCGzcuIFM8
         /pzEB6h0ngsjU9btzji+2wjIxrk1MPd0h5o9FKz8esce5BdwX/hKCZAVSpiTKwdExoWK
         dujT0moyPMDaqjBEberXtpgnSAYJf8+vla1vzGGYMuxUKalMpsQeybP00adyaodLCZlH
         Ki/w==
X-Gm-Message-State: AFuF++m9beAV9W2Innyi9r/kFHGd26k/Od4DUU9bpV7y4hGSumimmoGa
	6Aludm2nr+ROGm8wGqzGfChnnnH89e11VWu6hRTgxzc3QbgSfn8UiODQ
X-Gm-Gg: AYBFou19YSEKP07ZK2aMLKazRFeFFKDg5bHVAXAI4vSglFpaRqa3kR0zH3/OZMvYhtW
	TsBhvPQwr45a5kWZ5I4csJysKzQi4g6ykgdzFcfInS+44040ojENfauh3Ji8jVuK/QeUzqj0knJ
	qSFQUR4GG8PnLDnCOK4xNVIAEJtgxASUg0S18W1hsmcS2dsU8aj38BLGxSF6iPBnzr/fTOiN696
	ORO0jTRxaqtOqAX8vfPu6bAYGxutOq9C98t3/opAf/+06Dgblf270iss4FAZyfMmbBxShYoQMrG
	M4MzGW4ysweQJzIoCZH8I53duDOC1Cv8SHcegSOYUMNNOWXnGt4uH2VPBYY+jf7pUD9ouV3pGG7
	8TCSrQ/6KUhL44WUgWSKWCtPry4LB5NnoOxyTXAthjulRetgiWpGkklI87VxsLd3GUts2h0JK1C
	9Tjzko+b6pP8tCtlkkDxp2OdrQeAYWW0kBpBXhX9z7I0onQ0JFR/ZRSnI0U+CCT9C/K5jOdN6a3
	GH2SmjlebQWax1LFp1J2Q==
X-Received: by 2002:a05:6a21:b8a:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3dd8c53b1c6mr16053662637.22.1789973848374;
        Sun, 20 Sep 2026 23:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9391:ec5e:64c1:1347:62e6:6b8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31398048c88.15.2026.09.20.23.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:57:27 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon Digital Multi-phase
Date: Mon, 21 Sep 2026 12:27:00 +0530
Message-Id: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches extend the existing driver xdpe1a2g7b with support
of xdpe1a2g7c model.

With Best Regards,
 Ashish Yadav

Ashish Yadav (2):
  dt-bindings: trivial-devices: Add support for XDPE1A2G7C
  hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller

 Documentation/devicetree/bindings/trivial-devices.yaml |  1 +
 drivers/hwmon/pmbus/Kconfig                            |  4 ++--
 drivers/hwmon/pmbus/xdpe1a2g7b.c                       | 10 ++++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.39.5

