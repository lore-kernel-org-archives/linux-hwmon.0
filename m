Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901B731A555
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322211; cv=none; b=dUVWgqaSvlNbI/Kumh0PoHwKN2DLYUNX+jjqzqjOh+ylFRiCd9gVw/QYTpL+iyr+5XlrHj1ugZkJXSQo7ISRl/EQ59nKVT6Ck2pW6dRxt+SjzRGTvqRZligtBskGDhUu5TX4OQgagFhAdZWU3rVpBaT/XCxLtUWL+bW6SsB75eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322211; c=relaxed/simple;
	bh=iJ5zjD2EWw2yDJ5z4MSpVjmW6V+stFF2dP8kSOQKY70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJY2wqXdOGyN0y0rNr8JcjMW3NzN/B5Rph9WBbFOHON8DYvRpffx+15vcCBrFGuVJlgYx9rjhrNtmjIVvigYbO6vb5iZ6CMQjUxCCFNaOPb3OrGn6DsP+pDSrpW3+d55oNKxFHPAvldIQ8CuwGe8Tv+CUZDqY8eok6p+Og6rAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yier4Xh9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yier4Xh9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1051555a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322207; x=1787927007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QEFJejdXEP132PW639xF3lV8S0Gso+8wMOBeJk4UlZM=;
        b=Yier4Xh9iCsVEqGjmTOw6EdbngSngoMSzx7lKN8F37EN659bLub3ys3S91kbPbPOiX
         Yu2g97TOmN4I9inCUBHfwYtrPJqcKFp0O8qUNg+TA62unGw9VJHUKWqZPqRdnjfbfslF
         qDSIMOBiMaWuXCSf2RIwHuBIZwmEc5Oi3RrJm+fM6yZWo/nzTjnOyuX7a5qpkxyLwx1C
         qLbtHtvsBdMkgc5kJhU7g+l+SCaMcM5wkXgX1vFhWC75NP9m8ht5oZXobfktWUfric65
         ohmKUXGBVEJ68gn0ajCYm3x1SKFs7af4juAPH+pcCcnJEtxOVmYyOVccWBqhAqhGeBD8
         0mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322207; x=1787927007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEFJejdXEP132PW639xF3lV8S0Gso+8wMOBeJk4UlZM=;
        b=fPDrHmyL0ix8Pyf6OkkSVueoSSw7ve9Bx1FnUKK9rnMfFpXfV0UwFsxuB4CtEhRTGX
         qrAJDDb9YMcsUNNT6Zg0eHz58WsE43/0AEmutpuzLCY+s8VwJQN0CWeRiTZAq0DmTzOd
         yawDV7q3Mdb2Tk8MBVcoADYJv9JY3aoi5Ta5ZbnFXhYxvHYMq/3cyXNzIZ+5pUBvW1Uc
         TDZbhUVhJ8QtgoyXdM8e4vxWNojwWap1tSKLShnC8MokYKPY20qTAEXthcekC+zxLmIz
         0DSH62ucdg/1gQdVX1bL681fPIwg+NNLkfJxb6b+Ad2PFW3AFRkxqJV2OfUzcRO2JhYu
         t2Uw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4BAtUXXr/og6QnxfH0KU5cdsYdGUEdFZJarHi1zNYghnnJgR+f5A5kz3bGwrReJMkyfT7cBXmv/47yw==@vger.kernel.org
X-Gm-Message-State: AFuF++n3eCNaGNCFrKByPItSbEMswJeunwfzu74MB9sL59SRnkjf2MLx
	5e6YTQYUKPURSVsmdCJMEhsHCQXKoijXgTNMicZmbvVOPirr02UKp81B
X-Gm-Gg: AR+sD110ePvkrWOBmfpFQoASB685RwB48wbwNhYIzJcpxs33ndPghK65CtbTJJKr+Ve
	WJnu/cJFTjXRHibl1CWUrRnN5kQ1KzYH6kyTPUVN1JnHRRr0/gdq/jQz6kU1JvYIwndPp6IuM5l
	6beoFq8vpz37HI0KhvyTc2zphF1HBnAUA+SAzYa/x7W71dIX2kPN3U1T4lVduNMQY8A7bZ1otFR
	M9xY777l1LQVEDBpXT7bAQB9sTtEcVP3d4uzWvqFR0sZKYRW2ts232P/BbEW5FzBe0bBN448uzs
	zPnmANSCe1whGUfsxlL52XGGZoIncJQgtiiF1ubVZ6a+uPKYqmWe1tarQ6NYUFC+wSjDLcbR0F7
	pxgXxnSJkQuvGt1WgBhlFrjzSsP4jpDJtSJsOzol70k7JWXBd2MLT6n9qtEiQlOtKnTpxrO2PUJ
	PLFxZwYjUTzyw4HWk5T9+e776vKPdZsmbwfSXfhwic6jEHVBFsS++uEg8+bGnsBt0p8sug6vxw1
	g==
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr12901407a91.14.1787322207392;
        Fri, 21 Aug 2026 07:23:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm25714380c88.15.2026.08.21.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:23:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 07:23:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (sht4x): Add support for Sensirion STS4x
 temperature sensors
Message-ID: <e081c728-92e5-493b-ac28-9473eade7e82@roeck-us.net>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-3-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821091924.18975-3-alessandro.zini@siemens.com>

On Fri, Aug 21, 2026 at 11:19:24AM +0200, Alessandro Zini wrote:
> The Sensirion STS4x series is the temperature-only variant of the
> SHT4x family. It shares the same I2C command set, conversion formulas,
> CRC checksum, and timing with the SHT4x, but only returns temperature
> data (3 bytes: 2 data bytes + 1 CRC byte).
> 
> Add support for the STS4x series by dynamically adjusting the read
> response length, suppressing humidity channel attributes when probed
> as STS4x, and omitting heater sysfs attributes.
> 
> Link: https://sensirion.com/resource/datasheet/sts4x
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Applied. I'll send patches fixing the pre-existing issues reported by
Sashiko later today.

Thanks,
Guenter
