Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C75426D0B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308230; cv=none; b=YeceDTInLnRiNm+0PZYYERlkyJxD1T9wDMGHPCcPNyqYbiQKj+BB9+NHJHpyPTlSGiz182KJ4hyb0fCQ6krBcfZ4Huv8Ho8tML6VMK/+axZvFyWMvsbdTkrg6pfCrjvF+Kco7nCaufOBgslxtvJRHA6++GB3sPaWgmgauM90OZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308230; c=relaxed/simple;
	bh=4qKd5am21e2qY8GbvAvO7yb/uK0mfY4YXXzwNfMgzuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHyWhcpsNixBC0N/yUu7ZMBJk9bbq34SPpUETT9NqiwMBUSlpkPIux5nd2LlLxI7nzH/PvkjL9G0+A5Hu8hV6sSCQqLyY3Wgz5+S11D56oeUr7voLn5vqyT+khdqZSRy5k1+fxA7t0Yayw1ow5OVC/ZOx3eFKJ5k+IN2K9a6esY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5V3iN/5; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5V3iN/5"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4e9694so427657c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770308229; x=1770913029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vn73AtIowjRCivEj8TUze3MNY0GOrWSfsuprRXiaUyY=;
        b=O5V3iN/5IJ7o8O4d6fCFajHnBp8xndWZzS19V81jXiuW+zYM0D75fPaNdDIxKbIt92
         emGYY/DQWUJKZnsbXuzvGL/kwhUDMKmhFHmLxJ2c+TYhZbeOiJrz4JJiFl8VMVwyDliA
         JSy43YD5I+VCLAxizCOuJmVqFl+B7Z/M+ZYmtunpsMe8urVQ3Ys1OanQ/ogjhTgPq4QN
         w2MdgFISrx8xQDMCu20OE611i6Bv+93la25Sc2SBm8MiFFnM4Iu+3jqaiZqLRYio6qET
         GdT2LN3UjsDlSCPtw/6bf7OlA61KaLqKwF9TDv7nSqGChL3EodZhSxL/2jc2ylhy5fWj
         s0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308229; x=1770913029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn73AtIowjRCivEj8TUze3MNY0GOrWSfsuprRXiaUyY=;
        b=ght87bSXgVYm0b+w02xGpOo0Wqztmutuq9J2bJQJ3CBB5fe2y/3IMiyIsdZCXOKQQv
         /so6UpKrOJr+IGoQuVzn1ikvDD2lGOjG4d01XQLMEYIC60I/UybLiWS8saALohotcTt8
         PwCdpFNP6nXUJeJsKHYWCOFmNEHierpvkKY/d/yEHSrZ31L3ZDGHm9WEIiIphTlWbIT1
         fpE9jmmM0rlA18boGOBOIHdBTKryMitLp11OG8hFdeeaCoxofmR1Q1dKw7WRSjcS7e/w
         xYfz/u4ywFQblgt+J0Byoi8kcEVAdsVeqrYYnRFYeXZL42PDU8XxG0CWeWH1Npo7mrm3
         CtSw==
X-Forwarded-Encrypted: i=1; AJvYcCVMSKlTMp4QvevPTPME+b/zijiNmIx34lu+i8XqFZUjgkJLps0B8OOJYHJrBl7SAo2e/0OzhxmNhVKYdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZqoFVkW/r3MJqm6IkFWd74v4kww3e0bscrG0YIu3AoEhgfax
	mQQLGk2i0r1j7OeG9ewEhNgUtLJGc8hQokNtZJyQ9bPeT2QeqfwrQ8cI
X-Gm-Gg: AZuq6aI1mLb/dAMpi7pXRLv8r/1ox2XhshJNvwoIezLGJyJ1ec04ypW6NbBGmKmfXn+
	uJVouS0YZPxMbeNwmnHaaEgEST+ATynts+8qhQETd+9bHlhZn31iee2oKVaANFMH4ymdnPst0X5
	txlF0EoeA/3vwd8OlqRWkugrk4mf9Uz8ez+47tS4DNGF13aLj8U/zvBZUbuZSikrWUg3uxG9Qyh
	1ajp2c+PVEZhazJECpNo5FDdBnRrDlDSz68qgZ8VFUniUlutPK8NNT0TNMV2sAi2r9XSdtAgsH3
	ok6VddiIU0q4UshBskSHX5mskKAtHJYRsPeWAnCXCyjUfY7zgpZUxlIYyNTAymFsHpAgPudP/98
	5RMkWkyxyt8izd1XjSkr+DWMiwxFiol7pNQWEopI22LEHF8CGhDU7S/eGxGMqMLqiuTOQqm2zOP
	Gw7liT2UDvG85hmITXBy+YZ0B2sVmTw3hhGLk=
X-Received: by 2002:a05:7022:2496:b0:11b:2de8:6271 with SMTP id a92af1059eb24-126f47cfc0cmr3066033c88.39.1770308229162;
        Thu, 05 Feb 2026 08:17:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503ecf4sm4763850c88.15.2026.02.05.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:17:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 08:17:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Carl Lee <carl.lee@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786
 support
Message-ID: <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>
 <20260205-cordial-warping-pronghorn-aeebe7@quoll>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-cordial-warping-pronghorn-aeebe7@quoll>

On Thu, Feb 05, 2026 at 02:46:29PM +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 05, 2026 at 06:01:37PM +0800, Carl Lee wrote:
> > Add device type support for MPQ8786
> > 
> > Signed-off-by: Carl Lee <carl.lee@amd.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > index 90970a0433e9..aec7397a29f9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - mps,mpm3695-25
> >        - mps,mpm82504
> >        - mps,mpq8785
> > +      - mps,mpq8786
> 
> Your driver code says they are the same, so compatible. Express it with
> fallback or provide real rationale in commit msg.
> 

Agreed. The mpq8785 datasheet is public, but the mpq8786 datasheet isn't.
That makes it all but impossible to determine if there are indeed no
notable differences between the chips.

Guenter
