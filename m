Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC44446BE8;
	Tue, 11 Aug 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455636; cv=none; b=jPM/Oe5gdRaklaBkqwarXCuBlClwKNq/3A5ZJ93HtzMi1Zf3CFqG9BHe8wiA1Uhbg6Kp6dDNlDOn3WZa7oEvbVCOxI/VuVgaUlbmV5KNUT6RAXZB6j6uVYyaafOJHdEJBwlur62L7oDguagcghyUtVhDT9nacodKEscg0cm25OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455636; c=relaxed/simple;
	bh=J0G6KTmQjREmkbUL5+rpMEpLVDRVMP9vaM2KLx9Pz/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FULVnqTCD9ymTltGOftbjoc0uRwa1Yl1CcIZiSjpaZCxeVpa423uTMaAm5gDzSYKBEegP6gDwhPXh9+si91BhoVRT6GgoWeKfbLt2Yl8qk3P0DACEvjBBxiS0stHEO93whO9JBG0/s3ueltAr6yieH9BGbHS/JHZEQ1vDIEEobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8gvHZQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8gvHZQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226A41F000E9;
	Tue, 11 Aug 2026 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786455621;
	bh=tbbPmmiN6DdzYU3JAHzJNcZDtwZvDPb4K++xiBHoFRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F8gvHZQuf7IyCmlHRkpcwY8cE/iIYqMzbaaiuF0ZhbpDEib5zCYR6kMqR+02E9dAq
	 J4E7uqqjhh4mSADNsXFscf8L9Mp2H/QoQkYiplrFKZJMm4Dn5gJGh1BbZsrTy1o5LG
	 dLkqS1PgBsu9cQIo70S+W9ZOT5uGNtLiZeYZqXYMPGF+kNC037umFMyqLCHK6WTbQb
	 Lda0mFwvNvzTu2V6H1zN6FmRM5JlA9dwpyQtNtNArkqxyKM/NLOI6NNjCU0tLxZQx1
	 tiXuHxlUIwj7eAW+KNJc55FGWLGN3rKyOUHV0hqU8uV1Ku2Pd/ggj98WzfzAeA77H7
	 9ZOEcNj0d0ubw==
Date: Tue, 11 Aug 2026 08:40:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
Message-ID: <178645562000.2054085.7144409586412773306.robh@kernel.org>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731113007.145322-2-clamor95@gmail.com>


On Fri, 31 Jul 2026 14:30:05 +0300, Svyatoslav Ryhel wrote:
> Document the basic hardware layout of SMSC (now Microchip)
> EMC1402/1403/1404/1428 thermal sensors.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
>  1 file changed, 203 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

