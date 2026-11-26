Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690122;
	b=EKLgHxHA5sjrP8i/vXvvr1lZDDrMAvyGE5Ny+BCTKVXyyjmTJXtTDL9VrZSwpubS4PQJ
	 cgsSOqzEq+NFQVZGZZBImnNmOaqLsZ/ZuVecnfsgQXoNEeMcdDYlD2fdxPKGoXeFpn2On
	 M8U77V+bWxW5jfizQkOAj3nFHKxGy48Pz06bKE5wL/M3JYZSlXWYY8aT1tJr3DKG5qm35
	 KKvwGW2w2jwE7rAFq/UwB6nVmX3sNPg2GBj9nGbxWEaRjrF23j7EOq+JLDtxa9gAf5IRu
	 TL8C/NxCGFJIFv/Ba+oi/BLmpXoBqlIlQDDoacxQHKUnJeftBKCmhAgEajNWLsCeoxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
	b=iAjGZ22SsC+pDsrnw0ZVkNaHPBrTJQhNUm1RcQlNRL8gnzY2ZkwwV9uM/LaDODYLTH/j
	 Lf+t5d0dAPkgp2YOuIIW+nobxn/j7lCUWHChKZGqijokjgHSpv3mi3gZ9HDLygo6YCYG5
	 SwBlpVAuiCJakCnm4vNYwGfnUB5JtZIDAUhDzN12n2nGU+7KMPLcN+wQDGXLIlkESu8dO
	 ZIKsfP/TrLiEWGfP3x6MZ5X2hGo66W5+6PvOhB+gR2d1ZwlHvA7PWbI1CdbnUV7ElX4qV
	 XOl77bzjLZGeaTi6dkTjeIdsuqWjhIiYFRjC/7CN+BD5t3UXYYeVwm9YkEkbXDx0j6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+JSa+Ut;
	arc=none smtp.remote-ip=209.85.208.200
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438F606A337
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 10:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B438F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+JSa+Ut
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ae8023da24so34525891fa.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795690120; x=1796294920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
        b=j+JSa+UtPjpLo+sLj+TvPPvS+VD63xvtyFAdACGiYvbxcHRidvhEQo3BC4MewFvMDN
         zJrwV4oKir+FT6cOucBHDIo+Gyp9y4Ceyuy0bhyhV7Pb0py8HD/4PMQKUXiYUnFoWZVC
         WGMUhIa1Ecb3o6+khs0L6CBZqbAFYcl2FqmPLG/keSGCdndjVpO10jxNt5rcPf6ScdK7
         gvLGrSobF06UnvXpighfRp9YBMvT8cFK+fxHSPQ22rNxIqMaTcnrA7xQ2mwms3vQxT9T
         iRJvwc0QaAn24GiIA1PrvGWvXgsZFxZtNXquu8m96D075i50zKMlnRkR3m57dg5H2Bxq
         6zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690120; x=1796294920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
        b=pIi3MBr2jP8P/jA4ICuimLZ7Z7HLQUImiV6eflp9y7rEIWdmPQ6XA/fdWZcnVTrYDd
         J+pt5kg3vhZANYumvSP7UO3fEADCUIOA7Ue2uA+1tBeYyR8dGIwmJG+4OuerWSw4OHs4
         sGBH+jFdZaodk8+g5m/DgXYaxq33rsXYrcqba5p6ZGBFbIcTpw0khOp2Gddfkh7YCvpa
         Md0hSnQe11MLR7/1WWWf43iglGtsJMQVAB8fC6CdN0tre0ZtFyWJUFWWFR4Y/32KFVu2
         cJneMZ40oTdSEERRLmQEq9DjNgYFgNeOR3w2FQN5Xe9+mxU/ME56Yq0857lyvq21c/2a
         9m2Q==
X-Forwarded-Encrypted: i=1; AL+hErE0dKqXKNcLkc+zGmUnCi2Y1rUVDZpErR7OzzcDBaonSI3GYydy0rTDtNWI2Nmg0HBMb6yEpgzuFg+HiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z89KRlLSIYHxZyw67nXsSh7L6lc/FPxGPQlrYcYyT84TCy7JlWk
	389gZFVkm/bysEUMTG078I4JVItoW4deonNT9vlPmkynCxVgRVq3LVOd+cOaHP764jlPP8wUnsX
	MvQ6oroIyYA==
X-Received: from lfbfe13.prod.google.com ([2002:a05:6512:620d:b0:5be:4c8a:2f0f])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:a819:10b0:5bc:f29b:1a5c
 with SMTP id 2adb3069b0e04-5c1bc7d0b80mr4028854e87.23.1795690119891; Thu, 26
 Nov 2026 02:48:39 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:57 +0000
In-Reply-To: <20261126104757.2860272-1-dbalint@google.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126104757.2860272-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126104757.2860272-3-dbalint@google.com>
Subject: [PATCH v2 2/2] mfd: cros_ec: Load cros_ec_pwrmon on supported ECs
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, mfd@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mwojtas@google.com, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Load cros_ec_pwrmon driver when the ChromeOS EC advertises
EC_FEATURE_PWRMON.

Signed-off-by: Daniel Balint <dbalint@google.com>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..9cf85636b7f9 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -115,6 +115,10 @@ static const struct mfd_cell cros_ec_charge_control_cells[] = {
 	{ .name = "cros-charge-control", },
 };
 
+static const struct mfd_cell cros_ec_pwrmon_cells[] = {
+	{ .name = "cros-ec-pwrmon", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -151,6 +155,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_charge_control_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_charge_control_cells),
 	},
+	{
+		.id		= EC_FEATURE_PWRMON,
+		.mfd_cells	= cros_ec_pwrmon_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_pwrmon_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.56.1.839.g22a8290db9-goog

