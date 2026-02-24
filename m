Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0D286D5E
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947348; cv=none; b=Bi2+YUJGQEuswdwLKj4w1DfWUnMEFdk9mThikbyvlxXnl8pqwZLSMs4LTTIgkx6oAVWJCV5+UdCHX2+LeEZbs22d38FaMlVy+RSym2Yx7rKscNaYY06mj+9+bLILvJa3cqQKlBcnO5Ly0zzln6BAiXzEbsts/I8eOXh7JdG/dVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947348; c=relaxed/simple;
	bh=s9hFypPyEhqLBY/BqhvqCbp9TehTUSxKRhyZIRKnFUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUEI444zhcbIj6Bm8H/cZx2VptNzkdmKnD5W2ZsyPdt2LrSBmMip1cLVqr9VxDJSvXJK1G5i8nG2qcRVEmqwUZH4Jh4XWs0dWFM2p5hZ02BnwTrFSMwh03YT3b5vCk4tryvsMVVEk5SqT3t3z5MOZqzndBUPGNGQhtByv0Z/zPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX5SfcTW; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX5SfcTW"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso172905eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947347; x=1772552147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQzAZdTYZLzvnpB8FR8JqWHLblHWAqU131n5iIsb4sc=;
        b=XX5SfcTWbRhaz7XuFzfKEeqX/pSiSKOLuPKI9hivlIir+fHpOH/K3N3nV04kgfKCCA
         FNA3Sk2Y9YVqSe3vHcUzOxFKMD3a29BHD4LvdcZRQkidLqeZA8MagSk/aKXaH2modNmi
         Ta8DXjQE/boBxeQC+H5iNldQ+dHNEqezobjj/qTNg4G1rjkA5uwPKubfILstWadMv3/K
         +yyUEOyHDEkKoWyt+M4LVrY+13a91X2BXoIhdzadLAT5/fYeoYtiRejkD5y9kRnQ6HbZ
         79axEhrPF5HrEePELXljzsaqRl1zqUU9ier3qzgAlFKhRfCtMXJGggCUZftVvEB5PVUn
         22CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947347; x=1772552147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQzAZdTYZLzvnpB8FR8JqWHLblHWAqU131n5iIsb4sc=;
        b=HcDJujlPlXMEPBuBOyQHCJ3vzuQ81OeYVKJbm82LjUdgAoleHNIW5IR5OG06RydANy
         FHan4orbMUNO01ZcbxHAbF6Ggf3SiLaFHwzqjLEUXcF4jOPR6Zo2d0bwuLXD4aSwfNZT
         pUEb/5SsRXy+8TmnQQgNq5UGH6BRa1XcwO2YIVXInChcwtfBycOPzywHwelMinHZlUk+
         j6eGWa1UQH5idxOl13PW+VRVkJQaeln+HE7k+/2Dcy1XjftVhQbfuKtcYjfaE1d+y39w
         w2Si5VVDjfP1qB/NoflEl0q6rP+hQxGDvVtuJnS2ZIaC6qsqn3WhiryqPNEHCvZw4UZ4
         pahA==
X-Forwarded-Encrypted: i=1; AJvYcCWepHaGc7QYFLktMny0AoiZeZ2oBkxOcGUoL9qDvRfEweTURxnI2CC0DaMeRZec2SUKjcnlGmsjO9kboQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/M9gknHjjq/Fi4gPdq++ztZFwtoBGzzxvbl9z0ngP7mQLyrxX
	PN1njqFJzZQkOgzi8cO47er2a4yjhy1YjSNzdW1rxf67rswf0rPrHXx7
X-Gm-Gg: ATEYQzwwu14iPnrd7RFWQPME4SbrIjFZQewTW5C+dhhlxM24jznmAmbBmbzoKiwzsLc
	RmF1JjcIN2SRE1p1rcd/EDthgGczIs75ou0bxp0AAlIIssTWu2nV/sFVz78+f6/gkvcMeUwOPCR
	qre/WF7fTO41aQ5xY25Efk8X4o76mJpxWHh90+wEYnIFNzqExkESAp2qRrm9VNoj12Y4SuGXuxJ
	SEGt0DaO6PFsqrLNNNQPF+6XQx0PMdH5vf5QBVU0DCPOdTY/zehLC7VfWUaPrxbXddcvnASopLZ
	4pL1pE5dqb4l/OYTf6V77vUpd0xGoCVcFT7pD9jW7MEtFN5Hwp75wLVG1HDsp/XQ2koo6jVRb14
	gNVhcyI/fbh9eJLOaLDnTJWWoDSuD8/GOR4AWl5jfbkyFHbJnQUj8pgD6ytlakTR9sFR17icdNa
	OCGm4dnwwOR6UduO6IcHHKYN63Ak2TAwns1Aqc2Q4aSG8kTY4=
X-Received: by 2002:a05:693c:3118:b0:2ba:a04a:8353 with SMTP id 5a478bee46e88-2bd7bd4c9e0mr5295004eec.27.1771947346625;
        Tue, 24 Feb 2026 07:35:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc35362sm6801542eec.30.2026.02.24.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:35:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:35:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: trivial-devices: Add support for
 XDPE1A2G5B/7B
Message-ID: <91329523-f0e3-4cda-ac7f-fe3a6406f04e@roeck-us.net>
References: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
 <20260223050804.4287-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223050804.4287-2-Ashish.Yadav@infineon.com>

On Mon, Feb 23, 2026 at 10:38:02AM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add Infineon Digital Multi-phase XDPE1A2G5B and XDPE1A2G7B
> Controllers to trivial devices.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
