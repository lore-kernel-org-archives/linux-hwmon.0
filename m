Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750AC3264CC
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 01:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775093368; cv=none; b=OxMEWjjo4vY3zvawVkDBAXiNEg3uaRMwGRua6dvXmlePX3pYcrGx1/v6O9PoW0vlanA7kJtaYui2ugG1bh1hxdF4ATgA3lQFZCMV+cIo1H/pzqRe2BV1+hJMoxn7/vsxHTmJV1X14JxSB+wt9qg2+qd3adRoraimFy22Ps3ePBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775093368; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lh34AsqSxd3Wfmc8qLByjacB3FKrD/jDAcRLsphTL988yQ0U0fbgWOGEW3jjBIhFCSgNTULKhBW7wydaUsLyY6GftgRi/XimaPHnkazamFtaoRGUtT0Xv60d9bJr6du6ENc1yQTHO68cfW0w08NXYwrM8rMH1m0W2QFIAQGHZfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=ElUlyySR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="ElUlyySR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so10399175ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1775093367; x=1775698167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=ElUlyySR0d7RbBjdILXAGsXqeR2aFEYn3Bu2DHUvIjEXXr2QNt+Cg8wq9TfspCqRCf
         TcoVJvfV1sjRKqbzdmgriUi7oj9QyBaKOoZf7Ow1c4h+oSwmUbdfv+in2MHNeA4iyfU7
         GYcbqgWLLKDeuT4emTWmQRQ+LoDSWhPZuYH3TDzncXzMtAllCkcGuWEA+xsKYUNgoUAs
         Axz2HHWBKPn1poG+YXnesGhQo59iGV0rZS+uWVgALNgkLYJaf/HgTkphK4omQ11HmCDa
         1i4kmCpIdQde1gMqaFywLeEOWKVi+F99Xg/fczMhQ2eQKuePSZVrPqb++EzqkuGc4I00
         RI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775093367; x=1775698167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=mdH5GCnjEv9Yp1AC5epmeJMCeopk9sS++sI14n3wNWMKtkvuBTMlr0q3iLh+7d0mTH
         xH3fQep/SZQyAFuaSjirfVPbGDiRFfGuxuP0UX7fjs52/H8t0KQC6rRNV+DIDS330jiD
         LhUnk/+sjWHgYFiB1j3qZMJyBLcNYGlovLV0aoIQ/Kjt3KY4Mrg8fLbkzd2pzfD0xRq6
         EHVvLIVWJT06YLkQgX53CZeEETf+zMBvCey5hJn5Nv58N+8c00J5ik/1oQGJM+odfg5b
         YTOheHPat7bsMLfMTSqE/E9X0/jNE6jDuMH74NIxOzZspqmOPlZW3a5Lb7b1H7zv/imq
         eg6A==
X-Forwarded-Encrypted: i=1; AJvYcCXWaYcVMgDMFS7t/520B1S/vvy5CyEI7/NFp+M3xA8kHPAjm3PIWLvXebdjPhXyaRnQLNpUaOcokI/91g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCu6rAHtANkRzc/gHNkQt5G9PVoW0SjZzpQy0GsIIGujOjj169
	AGFi1RhMkUsjeTiGcupyBTysYtdJyuMa9Oj62mJY467LQzBJvA/4gkco/N2Ca5QkBDs=
X-Gm-Gg: ATEYQzw6Aev5tUeBIrn0FHT0z1nyMemrcC24RlzlhKxfQjq1nAEVk+NFZb+gehXc9TS
	F1yM6q2DbQR+MwOAVWBwYHQFHiTO3MUHcU4ro6KejlRL0RuF49Vx9ldPpdnrmz3XmKRq5j3wcUK
	TacyobfmuOBDP5JSUa95yAxvWrj41SVO/qN8F64zloVk3bwMZc2fYjSteIoMvVv08M+E7kCi1YM
	C8gkBn8QORKvULKt8QIq5p6Er2y10wLhMrvf3iBeiCffjWgKjX3xeGCsgSqNYOYaI80Afm6fdhi
	8IOnY1cm2HJe4POHzqWqcnTw0hjvu256/QHRxL3+72fXvZRVlH9S93Oo1GGA7gQzNkly73yRech
	p2IHgqAIFt/LXkGO2TyPjdxzBbHc0V7eqmNwzN4QsfHY/djCnFvgSpLHFM6Hp8J7ja3uEYXzi8F
	gcXVeLYwWWsb2bwtwH+QvLz2rY12rncyPkA3cZFESY
X-Received: by 2002:a17:903:388e:b0:2b0:4c68:283f with SMTP id d9443c01a7336-2b277d8bf91mr5015175ad.5.1775093366906;
        Wed, 01 Apr 2026 18:29:26 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm12045755ad.42.2026.04.01.18.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:29:26 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Thu, 02 Apr 2026 01:29:16 +0000
Subject: [PATCH v3 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-1-67a5184e93b8@inventec.com>
References: <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com>
In-Reply-To: <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775093362; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=+1TERg8IgQlcSbA/nW1hjD0FwzdV88At/ivwWfOE6Bj4sS8nJhuH6GgNrr+ekwh+voiUG6Onz
 caThKMgHusLDCXixwXWJgy+N3URTSjyi1SNHJJchSuEvmUEbPyzwwim
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

From: Jack Cheng <cheng.jackhy@inventec.com>

Add support for the Delta Electronics q50sn12072 and q54sn120a1
1/4 Brick DC/DC Regulated Power Modules.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..d4b78154df82 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -96,7 +96,11 @@ properties:
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q50sn12072
+            # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.43.0

