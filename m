Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D223EAC7E
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762233; cv=none; b=RuWTAg/aVLclE8ujM2C7L107gPLinH9EJPzObCirEr+4JoVTQILBkNoMX+ZLAzCksm63WtQ08o6esJun75Qtkdf0kUd2yYQYrnszuukIEPw9IxllrQLcqpxdo0Egf4evaeZLnVq4hStIw+huS2uTA0usZiGDrIxKywILLdWtT2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762233; c=relaxed/simple;
	bh=zRZUHoNWzgyD/ScVuU2X/ckq5rk/LdVG84UvA9jfae8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZDwq2aXw8WtTvd6MzzvdkRZXz3UikB1rzsH1GqhmixQykjUzZ9yGRj3Pxo81tkLYFCrv1fa2dFX7DcBauARgYxu8PNR2fscelXY+flWbmw8x2KUrvOrf2TAZUEL3UQjGYam4ObibfCfEo3qZ39QtM/I3F165hGr0MIc6ES/+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZERi2MO; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZERi2MO"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128d2e3082eso244452c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762231; x=1774367031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shf1P/Bjh/21uNftSB90qcfRnB0k5KOrDRJd2IK4DgY=;
        b=kZERi2MOhjA/VKpCEWi86TqumtqsOL3CFEvDgkBuRx1ry51LvMHSdG9Vqvp5ndooMC
         o8S3j6WF9jQWVYQ3ZMr9Bjpp2E7lGog/JRaxrMrKUn8JNPWNeZsJhKrk7qhoOl9t3Ygj
         F69ldlaSB+IYhkqsb86DeI2G0MVIMeLIo+kgu9zQjQ0FIAGItlrMX6KCkrWkc5sBI6JJ
         HUrI9qQ+GklilXEjjCieUtnvkYB9t9rIoEn2QPZwIKnZnp2Ikhc2cVnOWWn/OYqAMbfM
         igPUiFGQ//1/ADtICIrtAV5R3ovlAmCHal0WWmy00yqEPWL+0vftKgQiwYxLx0p+gUgF
         DNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762231; x=1774367031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=shf1P/Bjh/21uNftSB90qcfRnB0k5KOrDRJd2IK4DgY=;
        b=oZaVAdYY0J7m5hLDVx4PxO8vzSbN5saG5uk8L9pBDQSOUMyrQlFHTBiYJFJUFpex63
         6M+H+X2NL2d2Kg8S4oHUfAMc87Q/n513tlr38Ji3n8nWpfHB1nVVmwW20/dS3dD1+V/Y
         QMRG+t3B8mcybc6d91ghM/ZBiyWgGMRBxasvvSwICGNTMZ3MnAdqYEv2HBBn1Wkwp1eu
         sGX5LCKwEVjELC3xg8xITjKtL0bXZHZjM7hpW4YT9eEsvaAebRWiTmUUxZDQm80JaLhL
         xYcLlOe9UVZ7Gfo6XQGnwMTvqGUsr4NmJDGQjz4sR9y0Ignwio84CZVkvBg8wnITn0q0
         XTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4qiEzTfIZrm5zSecYRt7wt4YfKRVUfpxDH3vddJZSUYPFYYMMWYFiWhtk/rnXYHNYajY01M1RVeeEZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHCzXLu/gWZBVqkUAXvBVpB3ZDtsiJL7i2UV2Pnl4PWD4DmHii
	8QzPS2YWxJ+CHfYPe78UrLJXTrnIBS6AHcCXacgZ2Y77FyQqnJbGOUHH
X-Gm-Gg: ATEYQzy6EAyxQkW+MqX9UaQ8rCiQHGrNbd076XsdAso00anKMemWaB1/h737KbOeowp
	g/PRTMmd4ntHhy0r55PDAG13p4qRoFUXk7yhAgbqPxKKwz90obQVdnJ164by1fXSwPP84jP/TPd
	/jjJQFZhnGrlTCyGncUG75BW5sXB9k0kutzZzCgliReKAgDkMkEqU2g9PQm3g9W4h6041/+Ceer
	Gn6RIFhL/csbyK70BmECaQgAcKD3n+AOT8hGmX1UD1ntZIp+hFr2upIeZ0MSqn6cl90l2tfRmOr
	52GRKQQblCkuS+hwIerqNYAgYqTyM5CExbGNpvK+50/od7nWdyjnpmffd9bcFNIc9G5shBTRSkh
	6DmR14q5o/s4Oc/Ascqn5288Jm90G4r0dUrkjznxdha0jXqa0IGLQZgQffjY+D7DEW+uHK17wMg
	jUaOUWWPZ6KXmEqLbUkkafG1T+F9sDOJGU4oGC
X-Received: by 2002:a05:7022:924:b0:128:ce44:be8f with SMTP id a92af1059eb24-1299ba119b8mr6680c88.2.1773762231232;
        Tue, 17 Mar 2026 08:43:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f639a160sm16648121c88.12.2026.03.17.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:43:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:43:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7
 chip
Message-ID: <833aa0f9-6c4a-49d5-9ff8-297ceb508a65@roeck-us.net>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
 <20260316-add-q54sn120a1-q54q54sw120a7-v2-2-60e6182cc4a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-2-60e6182cc4a7@gmail.com>

On Mon, Mar 16, 2026 at 04:39:34PM +0800, Colin Huang wrote:
> Add the DELTA chips Q54SN120A1, Q54SW120A7 in q54sj108a2,
> 1/4 Brick DC/DC Regulated Power Module with PMBus support
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Applied.

Thanks,
Guenter
