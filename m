Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DEF1E3DF8
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Sep 2025 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091239; cv=none; b=IhzS+FsIJjfmTh+L3hWvvT1b5drle9aRWwNW2XGYRUzq11U69Ew2tjDliJ8YqOL3o8nYYYIz/8InpJ4TGgi3mOP1jjsG2VjQFSVRXQybKJQ0C+KUdTFo73AJn4gJKhr43NYDsiD81Bd7ZYwnTU3f30PTHqYAHSJ4lHrMdp/g7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091239; c=relaxed/simple;
	bh=d3CvzUjYSYYXdVvGb5ln+NyyqN5yoOhS5Tx0XiWdVPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tePJsgszvD4hSJY6yukrPq6EVriesVwKOR16SqCHZKAKMvfsjn9s5nQ/AnnAJfC/ZLpubwM8peRR6sBn822zaRCYJmOlkEZ372QDT8NDb77fWYbKFCzjXZR5EkzWjL5RPYhV5xSibkK4IKiujFNM3svD7fSOn8uKNt6gR7l8bdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lw+hKY8x; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lw+hKY8x"
Date: Wed, 17 Sep 2025 14:40:27 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758091235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5UUIFMPHoohc3Fdvc8WcHTl6i/bRaOEpCuA/zGUknE=;
	b=Lw+hKY8x9PeYcU+BuVv/eoxt1nvmC4NdQsoL9qf4eabtzRuqnHdbnFlTc7zbqM8Z5JScnp
	+GqPfyW8wvz70sJpNoYwFpVFe1O0XVqApx+mKfnQReQrmpTX7udCuW6JEEjabvWPhlh1MG
	N2xXN+8nqrJYfshZOgCtU7KFQsWbago=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: Add CTF2301 devicetree bindings
Message-ID: <aMpX2wTqXCSvEegs@LT-Guozexi>
References: <20250916-ctl2301-v1-0-97e7c84f2c47@linux.dev>
 <20250916-ctl2301-v1-2-97e7c84f2c47@linux.dev>
 <20250916135216.GA3674673-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916135216.GA3674673-robh@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Rob, Thanks for your review.

On Tue, Sep 16, 2025 at 08:52:16AM -0500, Rob Herring wrote:
> On Tue, Sep 16, 2025 at 12:46:45PM +0800, Troy Mitchell wrote:
> > Add dt-binding for the hwmon driver of Sensylink's CTF2301 chip.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> > ---
> >  .../bindings/hwmon/sensylink,ctf2301.yaml          | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > +description: |
> > +  The CTF2301B is an I2C/SMBus compatible device featuring:
> > +    - One local temperature sensor with ±0.5°C accuracy and 0.0625°C resolution.
> > +    - One remote temperature sensor for external diode-connected transistors, offering ±1°C accuracy and 0.125°C resolution (temperature range: -40°C to +125°C).
> 
> Wrap at 80 chars.
I'll fix it in the next version.
> 
> > +    - An integrated PWM fan controller.
> > +    - A 1-channel fan speed monitor (TACH input) for RPM measurement.
> > +
> > +  Datasheets:
> > +    https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf
> > +
> > +properties:
> > +  compatible:
> > +    const:
> > +      - sensylink,ctf2301
I will fix this warning in the next version (your robot reported)

                - Troy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ctf2301@4c {
> > +            compatible = "sensylink,ctf2301";
> > +            reg = <0x4c>;
> > +        };
> > +    };
> > 
> > -- 
> > 2.51.0
> > 
