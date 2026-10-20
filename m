Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482238;
	b=U2ZF8Eds9ykT79jqTcArtaTtfwWYgJLQXqlz1pENj11d+MsBL847Va0Tbk3Qd3O1gVg6
	 kRQKq54qa/RFTLToW0FW0uPLazD30mxX/6sPLa/7xLzH11vF3+6JI+gXfc+n+CXRTlpuF
	 PNREAoZjrFwRmIc0weO5JSKQHdRxKPu53m7lgMpU3rLnD1A0z7BZKBBZJINtG8vHF6IIf
	 LcAIzKQZk2lcXdlaTjEQpTiqIy8qwS8x0LEW5wD95c5w2T5sTE/fXz/AG2sOvcTbcNixn
	 fObfkV/paU6JdWfP3E8WL1wODuxA9FJHKgu/A0iGPMQK+XB+JF0Iov6yiNeIE+Dqbbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=ejyQPzIPX4XAopwgoZvSkORxNGMRAlhBTjb9a912GH1vV3ihbZVHL0kWay2quFcRehDw
	 nm/efYHCRdLKtIgYD5/RyjK7qeUT/lFqWezUi870709L2ts+GjxOHqx+kgspFE8NZj1UR
	 PkLAKdaaJ3GV63LT1tKtSyLhx7TRU+a1wyRnWl17TC8XF9rJio561ohtW7O8ijLLOJLw0
	 buJiXV0769yY7FRLPK/HN1uT1qa+S8Yptdq1TRKULcyf6v7DuFUD1hSoyojC/TLQUEkip
	 G+GmxOpYfBczmEEn81WBVIjiBBPSPwfi0sm0mImcsW2QlRODXamXX8YNh/36F88Mb+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E9606A328
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 07:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683E9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36661f953e4so387563eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482224; x=1793087024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=GDn9T631t40lyH1UVbWyfrqO2wY53BDnmdzrehZQ2IJwW6Log2x1p1Bcxo13teXjZe
         S2wsXRftK/azjVLiiVcWlX+aqXAo/U/7DvDfEBj5nLg1jsOxzLmuVHGiWLAglDgo5Nvn
         dl4CbxxzT5t4SxM4WB514iz4fde1by60lK0x7F4gmG0uYoz0aZHQz7eeWP2AOIDM972z
         J/++zzNo8p6AwQRgg6xkmfbAEgf/nkyand6KmdTmPY9H/ONy5pii/tir0nWGz/B64xiG
         7lCFPR1Kcx3KzO1angnGq2Bu/rD2zCxW9qeQOeLXCJwkP8vwuyXK6MjlBNdsx9i+FUGk
         mS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482224; x=1793087024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=eyrHaw6gQcGCAFLEa2CuHcuhbDmQc6MI/VH+WOOx1/Y6ASe8EVzE3mQJi9jq6aPYoD
         P0RarNoe07Fp47RQUs5fazeEXI8pLC00gXWqhPWhLT5pAOnVgjfceftxYdRtr8gS1OMC
         702/12GCMojqevBnMUunWo3Gf1ahbNdLOXnStX1NgYTjoeM6hwxgMqJRtSQzunNhoZLU
         NzDKifP+FFC0u+bO0xQpVYd9+Yq58Tx6clPZIY6a81UUaHjTRCJlBsSQDHxCwb7+PaV9
         L7H5LrfEixqQPJ45+JvVESi81El38xr4fFIPyz2NEIMz9HGE//lY5BEaUasW4V9yq1jy
         sJXw==
X-Forwarded-Encrypted: i=1; AKwUvBz10D1Hm+XxREcmrme5FNzQSDgdgoG5rb3yUQf2H2skcpF86uoRi6QzrPiuSnzM1GMpU10zidCdwqt6VA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBjL+N/SxeLfmWnbzjkY9L1qRMr2iRAhMjCGj2EAI15QNyI67e
	Vb6Cm1Dn3j+y32DweTcEwVkKZvsQtdyWFH9mPAzdtQlg0VeNzyBaD+CPw14MSg/2iqI=
X-Gm-Gg: AYBFou2KzVtIR9KCYmgchInKG/F4+SxGFxFETtCelF8PKs1UsZysNQa+S9szdHIJ55e
	zl6gh0EEJMDIRARMtq0xiRrCdcEI1hGB97SFP2r1XsfwgWqb1xz0WuUdLgl4T/Z6mqUCh8xahq6
	8z59fLfFGrETzW6/Qc0FrDBC7YX64/3h5a6ITVFtrFxDqIN95QmFEQMhmKrT6l7Bt5vbgIBNY1l
	m6cQ+d0VLxa82CnKRtzr9jBed+4ij7iUMSEOPfE7PNl6r8VWYoIWxSoCLvDvLJLNftRSrv/5VpY
	cW/8POA/tcNPzAXKu6amaIFl8NXq0gLYSeHuZDXYUEotDibw1nKYa/8saMVOScBsq54bAyVnm6P
	D2hx9BBFb8qV13QKHTU3vaxC2YKqXnBwCiEgM4mqDLPR7qA1qdhUm/erblhNcxn8ZuUwDVVGKoY
	Mhl9a/NzVmloi0IpgGA8WJsNqhvDJNWro0SSE2rNTNhLR5XJCT9T6zLEUnfsdhXtcXJws8zFViv
	A==
X-Received: by 2002:a05:7301:fd82:b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-361a302ab1dmr13910871eec.40.1792482223591;
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:38 -0700
Subject: [PATCH v2 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-2-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=mp7sRHtCF878AE0rEF4+2BUgFCTEPTTF+jqzbW5O5Fcke5i00ovvP/Y7ZA7M9N0i9MNyG4mPk
 xxLm7V6x2itAYD2v5b+PsbOVOFtGTCznbSP8qYSxGqZRZoJ/NEX7OLK
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

