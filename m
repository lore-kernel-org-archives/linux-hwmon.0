Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435546;
	b=UUu0Nh7VioQapbiPamslp23yhhyM6aF9cvSjjdXeyYM328+gdYDZJn1+P/582XcRRxj4
	 SUSLthFzJYw6b+ngJxgKSrceCxlPiBk8yxgMrfdzh0nLcFuZgZDEqdfk1gzgTdkLupTcB
	 X5LumHWGMjtIAt9M/+p42/dAqIDmf5Oh9fGPYrG9Ydeo4ZePJSnnQVdKItrKS2CNK6NDS
	 AkEA+TOp9ccjMsIvroVoDua2tyarRWkMDSXdsPk3XN7sLyGq0tflrIcjKxd3ExeqIdIgs
	 0ub61YFQJjbu4Iz0jDF2hddgiFT3sHb8hwQO7MYagQ8pImJNkZhjUK8G/ePf5bcrmbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=VddLs2UQodgSh+gdNZMi2B77ea1urKT29/XVuMOoQRGEE9okadD3GwV6EQ7BnrI3E3fS
	 w+gYUClo1po+x4mkCZXgSK/dCcAk/y6ARqBPZHWB2lgWojgxkSQYr+zHLecDVYKclK4gD
	 pA1+AQg47Dwxao14vOstL2p2EmHUBPZpQN5FwJ97VIO2DMUb6QgCYHfGWBZXSJ2+WyR1H
	 aVFQpEMx2XyOjnRFqiQRigRKBi4cwAdZpoLmcZPvqR9aCtw8H1ZZuW7j9BMMCMkLqT3fF
	 JozJU/DLKqA2xguYYp2OEzb8S11MnpdUyFSblHKAfCazEJ1IA4orSGEe1lfCy9KXdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=hnv72qRn;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B554606A32E
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 18:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B554606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=hnv72qRn
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-188406bb948so164329c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435544; x=1793040344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=hnv72qRn+iUt8O6TzLPtByCtiweKT79pU7DeP0K0o8D57V9G5RGqQtTG9IvTLC1vXi
         BThZ2Em92lZT9s1v2Ha8bNY2N+zOEZ6UR2+/XvXgvPWzM417TglE3oK/k3Fzcqm9L7W7
         weeRPCUIbozhqJbA0+KqjZl8gFI/1GBUHjKV3yQSH96dgPE6bU11eLtZW1kzLAckFGi9
         SFBjTAABE6B8dxttC77t2tQMpRBUFWN8GQYDs5+PjPXiUVhe6yqAogEqwE/wZpMr88/Q
         zm/+btYsav1BnUznBSUOHHHEINaoGDZGlhTquZBQ9xi+7wQ9DcPdEOOSg69Zd2r6rkhn
         79xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435544; x=1793040344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=OVrUmrPQPfEOpnQojbAto4PketopqwvxvepGpsWFetbp/kJjnxf1PspT5mxmvl10fK
         nAWeZAE+FEIBg+rjgt931UwRpiHEpFUQ5Z2Q9xTr9xqJHbo3KRVAbRtGKvHVv7wmk6/E
         fm0N3IZfXm/JoeDgaw7OGTs+8/uPEvTxFcj12n5D4hRHQG/T5HTi1P6ah8NYrXDCsjCm
         WEjveGPfxNr5Gzs7oTVQuOCORQIDzr5f1xbpUARVuL1eigs+iL9C6VEYB8pJ4iftALYw
         sqRALObXvvrQQn0FOB5BI8q4dFCabpgPfmbbmDe6wTa3/rLAf06TSCFDHiWsQOj/bK+1
         vQGA==
X-Forwarded-Encrypted: i=1; AKwUvBxmUg6F6arxeKVMmMqTD9dwQIs4BLFby3wQrugKd+t1OX53Zx0ecsao4UOAlHoj0nSNYNE8XsyLfTUQXA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJUR7rt+wyx+HRdIbvWOR9QEUjJthNYyykIAyqp+8uhrANnZNhh
	2E2He3k6w8zvjkkYGoJ+PEpPDNOuLBDRL/yhNr+mXpd7WO1Yje7EtVv6kFB5eJxzgFPbt55jLmL
	qSoSqqIA=
X-Gm-Gg: AYBFou35T6/2PPXuktUm5v1Av+hsXFky8DX6Lzbo13g701/tWgPlcuKx8dOgafbfMSJ
	8zORMxf0TFYUzBE/MlPcKRId+zW2IvWsjvDMBHI3Meydakynqa2qkpPyFjO5Rh4HXlPhA85qluP
	KoP3s0z/+fZU1zPSs3XH79uFFHRa0A33s0A+gFLsqtlIxa6BmEQuBUHVm97USE98cIRYs5Nm29Q
	4ziehrAjiqgnVEO5P6D/4R8VOrNHIDyIp1WrZKUa9iRO82HDEFDk0In0t1GNcd2AxdT3RPTrhqb
	mpJXttLY+S8Kf8cv9Athx2FAm9aPDYMOc81WhWIsMwnTS1qv/JrfcgOVzj1ZzKWvI8Cm6srhsw1
	EM6YQMtNsRPkZWCLh6kbiAeDo6ccUkmrYKd4KQ43yx7CnqsqrkZXSugaXwoY2Gwig0Jd7n3apO1
	XGb3b26F8BFqlNwX8GuYTvhiierG6kdjSivgI57PUh88O+nkekLlpFPkR7Y0B24D8U
X-Received: by 2002:a05:7022:b043:10b0:144:c128:4c4d with SMTP id a92af1059eb24-185139aa945mr12351075c88.38.1792435544338;
        Mon, 19 Oct 2026 11:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:14 +0000
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK
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
Message-Id: <20261019-fs1603-v1-1-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=Kh57j8s7DigWfkjHFM25DugGH1/bTpHjS2ftggA6TludMkXbm72al+7MlNKKvjFQkZ2BdLHJL
 cA+nHKU/lXfD8+FFfFBtdWxIKqrGJKB3rxBJfK43MXO25pJmZ/UkQJ2
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

