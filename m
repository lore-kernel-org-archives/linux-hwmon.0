Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C74B387346
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625959; cv=none; b=XDcfHOOxhD9RKSYXTQ1KAzDVU5j+Ypx1ARGujAiF2hy8zEXBgCOD3I0DxmjEUHFsoLHo0a91naoU8LARg8BfdosMO7eaKVbPrRgAk3WEJg2O8M2ij42n7p/gkDumjDinsavGUjmznXufwdQTEe/s42yi6/8OwytwSCpz4iHvulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625959; c=relaxed/simple;
	bh=vfdsOfPIN4ax8m0jl3BhSnngPUkt47sIt8pYap0c9gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zb9C8v1slPpJhZN+n3hInjA4hK3hndUx8rVg3R0NllC38dg6Utw3QDiB8y9BNaDuDn4bko7qoEV5IcMMFLDXcxMCwuKZekCKZurkS4nsuH9si8ZBNGnH+KmXrLSW+IO9hczPOOxFLGakw15taFuvtdvhOOLffcpV2JnkYbd7lIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=cgyS765U; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="cgyS765U"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1309f4ee97fso7580249c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 15:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778625957; x=1779230757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnjBg15osgUc/DHul0dxc7zos8A55rHk0TXyJ9kh9iM=;
        b=cgyS765UtTuBPjG5V9M+qwpbGx28Y3D1flm2UmBUVM8cq7NNere1Xmz77864vPlbH8
         o5SQortpWlo2MT+Ph0AKSiB5pQjRENrVBmFc2LdZL7fajEA0twpeDOXvZ5+XS1U2LZhz
         iZ2I4wG9y0F8Dzv2OBVuAgDTiIz+gimr3HK318PxrUffFJ41YG3JHy9XpuN/e7s+Nsx3
         /PrRERL8E3u3aUK1hTyWW+AnYb/00l+FqxOp2ucDecUi38AQoDVbSHyV9pxGngpV3Y2p
         U/dW58tOceWaEcjr6w0rqI7KuFE2oQnVwIloV8wtgAVS4bmwrT7xHrq2mXs6qp2edz+B
         hvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625957; x=1779230757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QnjBg15osgUc/DHul0dxc7zos8A55rHk0TXyJ9kh9iM=;
        b=DzubqTCxMDvV1SVWXXMBWVG4Va6ojiE89BNT85xsJxcECr2PKkwoy2pv1Zo9RyPiV0
         6utPE506G2dhM/fFROrcFxuwV24NNcNO72rrjKgD0lQnNgaNZxr5MSr0MujIdipVVnhy
         NAxdUZ29Jmd7SafF4D0zTpICZDt9C3iDBjLb8dbHwrBPPj9fSNpObgs331bte+AlvWq3
         Qkuer3UASNlqxLGMXXXNSIXG1iBzsGd8WkNwqQ/1ZE9674VpNjo2HdtQ0Ne9e1YHTHmA
         nqyhyobCiSp9n88OKY1S9N6j3i1uXfwhPWBDC70Ym+JAGykOr7IZQtiIS9q+oHPxQgHF
         pFUg==
X-Gm-Message-State: AOJu0YyO9Eh5HMpuL96BhWiAWTvbajz9ZxtZutEkOD/bWTFBNw4xmlzX
	CDXdbbzLCMlQnCFm6eEDlW0/bzgktrBa/dFkqaL2ZTvh24zZb1avkmCM1i2DkcudaBlrY4og2Kg
	jCDupXzM=
X-Gm-Gg: Acq92OGL+fmBH2M7+7e4IC92A9VqGt2paQ/FG+UqrFp6mCEMNhvQ62PncNLmJH5zy9t
	UxVAmWNaTq0RsM9z+VZwNQv3/L9OpEGdsdzYEMJazIDnezSeqtsEM3brE4qj70Rc8OdnwB5kD5q
	zDmqrOqUZXLYE1MFzLc8VfJAiz/pcRGkPbDzM9HVFMAco0VJ4JX/54kJM5v7EQeFR6B6c8Pa5HQ
	4+fKJL0VFfUxmD5oQx8kYGt9oDFW12eyZ/JP4i5DqVVehNlLqmb8MtSnHg+l++mq5HoUI7sHnPF
	ukYqegMBHBDJ9flsX1BFP1b3KySsPHYJXj7Wn0K2HRfcD7d+U/i9M+KVfTdtpUHOh3zCbrzd9sl
	Q5V6nlf6lQMM894VCEeOQd3gzKgEtXRC39kYbZH9i49KcMKS2VSlijgQKSrq8A3zqH/1G7wBpZ7
	qL18jc1TRlLbzgwLf2lXrvVc2D2Q==
X-Received: by 2002:a05:7022:2527:b0:128:d577:dc21 with SMTP id a92af1059eb24-1349a80df0bmr195310c88.13.1778625956588;
        Tue, 12 May 2026 15:45:56 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm25351543c88.8.2026.05.12.15.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:45:56 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 15:45:52 -0700
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Murata D1U74T PSU
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-d1u74t-v2-1-431d00fbb1c4@nexthop.ai>
References: <20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai>
In-Reply-To: <20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778625955; l=1143;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=vfdsOfPIN4ax8m0jl3BhSnngPUkt47sIt8pYap0c9gs=;
 b=7UcDf9RP+aa2HbAiVnF4yt2aJpKq6u1pfzXLnY9sMccJUQKWdmuDb+TEoszSTCMjhukHvXWXP
 tNkJjIBEp/zAjCaAL7dWniJOyfYu/BQKVt9T6SAMBvMtmlRjtJOrYaA
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit. The
binding only declares the compatible string and i2c reg, with no
additional properties (no regulators, no supplies), so add it to
trivial-devices.yaml rather than carrying a standalone binding file.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 23fd4513933a..19c8c7220858 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -352,6 +352,8 @@ properties:
           - mps,mp9941
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
+            # Murata D1U74T-W power supply unit
+          - murata,d1u74t
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control

-- 
2.53.0

