Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A634733343C
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987205; cv=none; b=ZLG720sXpV/l5yMSMBj9OFRud/Xtu9xTskUujsZLurwC3hVHaBnTvgexoCDTt/chDddagmJOwaVCCgZqB9kJMUXL0mlQ1RMRCmYqReIuwNDTW9MCHJwBpB967cwyAcnJbBg0z2LHkQFOUN1HGWjPudial6Q2N5MzGVsvEHAZexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987205; c=relaxed/simple;
	bh=ibbhpUEspwDnILnKp6x/633TsOLMgM9F3dwGA03ePeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1ADFuKyMAKCkMkeG542wIoOwzaFuOIJ46qClKotn7U4TJQTu0AkOnAvfC8HAWZqTEsODD+MzyEXj7pdwPe4p7sFK0mRxEwcVggeGywkeGXBnzWQ9h/ddoldVIS5ESNT1HdAPmwHRscxXXf8rMS0VsiKrsL0CHEUf5Vj4w8HGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTNhkcnL; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTNhkcnL"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-130c653cce4so1015791c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987204; x=1778592004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hZDbpmJBO/sT/pu/TH8yzpFbPIu2coGqQ48qccMAdc=;
        b=sTNhkcnLvvKQEfJNQNcp3yu62lmQLU0uw7NCxE09P4qxqzOEucyc/YDRKCTsAIUni1
         AKxhBRLCj7Ejo/vcNFIlIP/xKzHd+0R8p4x7DPH/+XSQPUW27DCr7NebgzApsAzf39CD
         cFeWyfyStHMK8f5XJ7tW2QQIey5G7Y0kp22A6OqTkl3x8vyqG7ig43Xg0rlj8qMWtM2r
         S1QcUWGFVmF43YlHZAWzjEEMCJn7iR7KU2/Qi553cpZyR5IEHpkzljBkbmqNb4X6P+02
         q8+hFjmoJq8Im5YfVIsq3yO4zcfP1DygI3mHC4q2TpWqVMkc5+yyGun8g+kw1pVf36n4
         5Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987204; x=1778592004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/hZDbpmJBO/sT/pu/TH8yzpFbPIu2coGqQ48qccMAdc=;
        b=YNBxoBWCQ8CDTXxRHGZhJjEzegCRR07wKAscVh6h+2iJwHC1s72ZPSMcpMTEJAfTZS
         vradqqOay0M1GRNIG5QkJ26bpOU8xFoVdSW+QCsIwOTSSiBs5GggrYts0stM8lcZ9kc9
         oaO76xGxCki/4JjBrkQLyW9b38CZT0RL2RzqoBx8sXcuuxiMVIMhbjbHBdCeYO6PTdA2
         ezIJETq2Uk1yRhOHV/KVQNbzu+8mNtzqm4ekCZQLjkJhHvj7T0Vgw+zH/iaAjS6xlqJw
         UYKkaK0U/cXGew2EtBysxfsVf0nVyzBTUoYlCYg9PSQ8lE5EOAPYAoNsfAG5VRMCBKi3
         J1Lw==
X-Forwarded-Encrypted: i=1; AFNElJ/C7ow8ZnTg2VJXXz0rBx4a5T5v52oTR+fqKFhqHRW0tXmQZ046lj5uEsiHlHKKAJ6u+P5Z0lmJfioRNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsNhWDtqHRaFD+47X6mUxui3gPIfTVvsW9Cm6sGNWT7tNQWyBM
	hVHTIaA0zz9ej60UhHYnBnJ6G9yJnRC7zCqG140IezFf1DP2oG0hE32n
X-Gm-Gg: AeBDievifbx5D66B6FbfkY+6oaJenhIXwR/mZ19eXC2vzaqrXLIs1HFPC0zOZbZe2mf
	zg2XVbMWk3PoBPfEdrSyk6dzxyABqhWv1KieUokMpbIgkKcA2rVJXHjlsNmkKwLsmnGu8UDcUIA
	En0/juIxuBrwsRBjqw9JiAkIBiv9prTBYFli2PikjnLJ4KGM5vH5avUooZ0kCqdemSpoWOunxc+
	/XQtuwxyOSWrDgPNy6Fcu233ILSMHyAYF4fF0W5Zh1nQ8ZdFMEAsIHql2rBMimgaCxDH24IY8ZU
	pbisl0SADoVrTgU21Ow1cn1IPkmwWjfK0kYfIazf+SSq5qNZwYFvGnfF4HV7wRqqGFB5Hm+Fjfd
	KNQ5ng/tmY4pWJ69Qz8n34aVPtK9AdYOkFyNU8VRxl+XGb90sZyKDPffEgtD1dawAy+xynqbhlE
	x7q/LwbhF5SJcUWhGV0RMF/WQpBPLWj6uFyU1wJyP0hu+Ai9k=
X-Received: by 2002:a05:7022:791:b0:12d:de3f:d845 with SMTP id a92af1059eb24-12dfd878a73mr6644320c88.40.1777987203611;
        Tue, 05 May 2026 06:20:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df843f04esm17670938c88.13.2026.05.05.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:20:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:20:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] hwmon: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <f0aca43d-6fa2-4e24-aee1-17943fab6b62@roeck-us.net>
References: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, May 05, 2026 at 12:29:22PM +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
