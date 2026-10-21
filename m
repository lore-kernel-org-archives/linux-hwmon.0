Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551734;
	b=SaeMvIVpRBi8/rKWessEG+olr5Db/g2dZmDi3EYL1Sh5IWFEuPG05GiHj1muTs6UPorX
	 MoLAbH0aot6Htb8Sz9jXQvvyrLVRDiTSOkEgviUh5YOKysQoeTAKRtx3RhHtOstCTkoWa
	 dpzmloIonugtj1zAJ0fLBPxbWw/vvkqHt2lH9Z8iTP9o+qlUjN78duEWWv3WYoyAkNNFy
	 AZ+FROrp2fhlVQSahDkIz6FnrEhXXMoGVB9BiialUJLTrv3Xh93qtRjTmbx7vXR79pwGD
	 mOGjJLaJdRutUQpWr2WbH7K5MW5AIZQXvi3k4QgjI3IKJR+ik85GhKx88F19XM39lag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=VVc6Byijb7ZNthcXemJceOUzArPjCP6NrkVaiyyyiVxDdKotYs8OVDLkiGkiLI0ayMEZ
	 LvlUToGMuLS2bOqvb3MGLPa57HWjOs2UU98dcAXwQgpt6hIRoKJU6CzMUgKRhSVR+C81C
	 rxO/wbytip48j5AnKwMdRRCIjtgwXqPCy/MzKZe+MwWms00XRYSk0qfWWO0z55jizp52e
	 5Srwudt/v1fAFPTneBEa8OX95L3OIu5eL51wGnGP8ALa0pyE+jUMBXD5e3APp+TurgrCI
	 Ahl+vlqKSTSNgK9ZTKHKl7YDHnW6BGhiPPXqW8YlaTZb73nhRDOzbFt07C9HR+dkBmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyKb+VRi;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B311606A32E
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B311606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyKb+VRi
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b2c599f43so482695eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 20:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551734; x=1793156534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=OyKb+VRiHivA263Xy2QCsTKpkhUU/d0NypsLDpV8kv7ulF6+EIdhvwgHbCnhpjZYk/
         2TWHksOUYx/GptVqd+dFLK3WNM+ZSKBtKVb8WO2MtQsgLPjPsPoTPlhU8RPNpxIyp9Kg
         Bn6Z6AqEWD8kFB+Sj+2WTDCEFuXnEzzUjG1jE4dUVLNfOjraEmVhBuP7mLuBKCSdV7XN
         No9wkl3As8JurEkIejQWxvPNqqUajCNUHV2CmB0/CJKPMFoeSiEPiP6czha0Hw+8bhsq
         Y8i6qYReNzupZH99xefaLCFp8p4cI4wTizG3rqpgEyPiiWljZlLaAbd28K765Zgtvirk
         NvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551734; x=1793156534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=PQqU2pqlZfHTWC6ZVw5QylRnMbCndOVvDARA0884woKRR53pK9eZSfN2IOJOymc+qM
         1qMbFZBFC+ZqNFQSJZM5RqFs7ALdMyVcuqO1NmJerZxV3O0PoEb3uqo6r1P1B7ltWaO7
         dKwQfWloBcGk/pN/K9nEraJldc5neoRPFW5vr0bUzT+Rsnjtnit++wvZQeK2EuatgkbA
         t/UX4yc37MDCJNQoI9mUUsFSbuKepimgc2yR355YDu3qRI+iNit9fGa803G58p+cKxaC
         lnwVcZW+AV/jkyv8UIbOrfo+fayKTVuuhtSZKIuqReawEEmJfcwK8aTBW26nsC6XFdi4
         at4w==
X-Forwarded-Encrypted: i=1; AKwUvBy55W4x+X+Uptb/aDnHFIbgWCZEAZoWv2Yip/5OL1RX64TunihhvQosvjKXvvx33cfLoHpAeUIxEYcALw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ4S9aQfK624s4JZ76nVJAKuoCcdIwi59L6ed3hbA1Esg4ABFL
	XasXdRI66Av73jLNGCChLhVfqU8wL9L8nd9ZA78k8RU7UXBqEi287qiOzo98sr/3W3U=
X-Gm-Gg: AYBFou0Gn2p+j68DJ5pSxXxgjSkX3w5k5pcYDfzdCckk1tgryNP0Vo1j1kY/xrKySfw
	RxtXZrpJTxkYvgt0S4CG+GphO03Xu9fY1EYvYdbe8u8b/usxPz9ZWVpIacNU37CSYL+MX0QKLUa
	olEvhj+wFO1ZEnAr/kRxfuJS5Y9zQ6AzZsNGOPV91q7m3TW3hLP3fo5EVAAeEeZrkZqOfpEl5bE
	UDdjDrFHGuHi+hdhDAVfdaLg/DZy+Lkdch/ru5o1j2WQqWM/QAAEd25dbsFv3OHTcmzs8iGQn/I
	tvfHuUCO6K9lUo6W+yClb1DNnXMdkSNzZKB9dn/aajU2vyzSWdlomdW8GjYNDs7y1Aq9NvmHLe7
	f7YDsVrfMlvhsmGpjdtcvWrVx8yqK3CfASVvPz6ag2MZKrLciHERwWZYGrRe4+iy1JHeUmjc+fH
	MrKhv8CDjTG1IJdWZTCjrCjFpn/SE6WjNoiv8HhG75UL3gLpd0bDKPhGkX2m1V1t8rcyy6Jxta2
	tusYFksGOaFUTeec9CpLfd52Koejy9VszQbzXk5Q8uLiAzHWZCtgjdpeRw=
X-Received: by 2002:a05:7301:860a:b0:366:6ada:a052 with SMTP id 5a478bee46e88-3674d84d319mr1455767eec.8.1792551733311;
        Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:06 -0700
Subject: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=ZR+1jUcctG0ML9NJYbjTUXiZ8OahgDHMRTQAoKHG93om+tIlU/j0W9gBsUuED/bEbOC9JNX7F
 VW+Hbti7lLVDZsu/l9Qg2XhvBk8KokV79WhdB/IsNbYhtchl42/JUIF
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

