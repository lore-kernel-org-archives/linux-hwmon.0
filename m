Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6D3FF885
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427167; cv=none; b=Jj1Z3ziJXfU8y9LDsoD/K2ov+rE3ELml2xfIAxHo5afSYa5zJ1cXcCQ7N1u7l6L35HH1Hq/ndV/EqMQDxw64xAGF/yWPbDPaak6qtDMM4qCBumNlJPSvitz7/7rRsDARt3aPhHMhQvdgDJ3/n5gUFE6+m3aogytrop7QtWd/pJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427167; c=relaxed/simple;
	bh=FH8tcHR+Kf/Q4WoeEbtw1NyA3aDEhztHlh0tNOOUXJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikPfmWccpeLclO/slsRH2U+TgooNEMJJ1sBc/yeR6x8af03JLAciPRDN5hWzQVln8GY3pAfmi6Ntgcsak377fZCNqD0Ag7OX989hDjUBbHhGG+/dvGdO9ckJ1OyMLOhKOLORJ8b4K/TVqcEsejXe4prpCbbKyST/eXIKGjXwohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7FdmV2i; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7FdmV2i"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7c61b5292so58862865ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783427165; x=1784031965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgLtos+kVckpvEahUESh1dXWtYuNLZ70j+TeV2rQ4j8=;
        b=o7FdmV2iz1KaHdVLavYCaIRIISC/kCF8tM22letnR4qRyL4Zw7/ApG3Zz0EeTngp/0
         NfNcqYYher43e35vSpifNA5sgX8b8OHo5aWJS3VlBA594YUqE7JqlD3/M1zIc0glYzWH
         6wQLsEPgzE9Wzvzdf39Dn+VEjGhk2YlRZkTSG8gVzFyZHCAGx4erkjksjNXaZrEECOIS
         04E3gRICbwRNSzKVCs5Ukj0Azyo/IpIZf8j1Di32uma0iW4K+dsOBvEV2zhIgwk71Qqp
         fK5B5M6//dwwMqUlf1GoV/Jo3WcrOkmM7TFeaEflB6TUtKBTW09ZNpZPrES2xi/4hEmj
         inGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427165; x=1784031965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IgLtos+kVckpvEahUESh1dXWtYuNLZ70j+TeV2rQ4j8=;
        b=Bc7+VErOSP7fzsFwKuMi0HKe+nkY5yalQM4ellVM+G/6w3gLk5yi6w5lTKKYrACyDm
         bx9mc5RiW99NJJdS5Ri/5mHDw/7O7QjX69CPkvnOtqSdsJvHZNYQVK1BRY6XgETdf3B3
         Ec6/X3bJKefLiFsF+gKPjtsBYJTRxjenQW3UDHyaJWdlDbimRIb1zTg0m+99F1RgPSxI
         4Pu4SznOrCsD+Pr3N+uG54hwFsi2vKF+NblJb0jhAFEGCVRKy3z5OwrWdONXmsXkAXfP
         +9K1rcKZ71/HgFNzex7KSHFTUB6JwFCH6nQpZUw3iRajhrfwH+zir9h90BiiFO3xPNUd
         3FfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPyKaGuFnLuJW9AKApZIMPn+X+l5eQWfbkIwB9H+4iMlSfK7l+yHmVmYEtHHrPMbmxuJPU23behMns7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAj5RQy5lkfyCNl4MRy1/Uh/R+1ji3cBCRGx3tinhtpVlX6vns
	ucOpRfLB4rcwHwowWz2q+d+xgckMAf7aufq4xRcYs7swGdNsQmC5Co8C
X-Gm-Gg: AfdE7cmNtxTrID6Hmjh3b1uhXCdtWA0uEy3q2zwkZL0JpelZ2aaYpdpsOGIxPgAvI+2
	gJIia8ZECOZo/P67qRbSzahYpT5sXMxG5ttuMfXd5Ae+WB2G/PesNIuJfgSPMEZT54/dB8TPydd
	5WjlRX+hlYPRB9IVXZ8VQ4+vttzW2o+FZIp3qrZ0Zs0R8P+WpqUi7JcqcbxZT+1Y8FyJen5nhyq
	Lpyugr/qUD8ObNC4CjoocmwrC5N1yRQgd3MyUaDQJ1Ox9QlHywYxXA1vKIyyfHI9nC/HyhqcDBq
	UB4+J4PCTuOa7FEzyVp0B88hdYOam8/BR4kwqHlVjl0ApuScUsW0aou4VLLeYYUR/NvNsu2fW2Q
	lqCHbIiG7io93B1+NmVpef6iob6aGEstc7erH08+2NbPGZxIkLxg/v/lIaf/vHTowMlU2KXXagL
	S9k8eyTAhEBMol9Mwv0Mtwwsloo/X+FL7wFMH0mSn4y7UA8QCWePl5Oh0sb5QzMaJsi1Xg4tL9P
	A==
X-Received: by 2002:a17:903:1c2:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2ccbf184d59mr49746515ad.39.1783427165522;
        Tue, 07 Jul 2026 05:26:05 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm11078765ad.37.2026.07.07.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:26:05 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Syed Arif <arif.syed@hpe.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Colin Huang <u8813345@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add adi max20912 and max20916
Date: Tue,  7 Jul 2026 20:26:37 +0800
Message-ID: <20260707122701.751878-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Analog Devices MAX20912 and MAX20916
Dual-Output Voltage Regulator.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..5e7fb4edb82a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -57,6 +57,10 @@ properties:
           - adi,adt7468
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
+            # Analog Devices MAX20912 Dual-Output Voltage Regulator
+          - adi,max20912
+            # Analog Devices MAX20916 Dual-Output Voltage Regulator
+          - adi,max20916
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # Aosong temperature & humidity sensors with I2C interface
-- 
2.52.0

