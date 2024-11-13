Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6AA1FF035;
	Wed, 13 Nov 2024 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731521687; cv=none; b=hVJoepspMohbES9GSQa5zYUttfjy93P0tYJrtlkraMSJRDEV0+5aNSHFMmawWTFy/MvsaX2xO9rCbKNGP+VHkMhoVASrUJnBXSqFzev8fKtqt5CV8/U41x7a4BF5IuHsYxq0z4KhxWEujMck7J4591vL7eacH6vAERtnHmX14ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731521687; c=relaxed/simple;
	bh=tlth/xEOYB6Y5Ki7U78pP9+5Q7ncBJCFV0cKZDTpLYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMY+4CDsrrIzFsAuEFElFIXOQnW5kuUOTQ9oOkPDdxUxIET+y61562zu+9JoNDq00DAED7uz9kVCo3N2lUoxe5FbgudhajUCgzCrosVLtbX5YhVjhu2/ANr6cEp+7hWiUDvsB7ksHUDKQERUqLeRmyTkXDIMYSLFs65IMnAynAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZiSopK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZiSopK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3442C4CEC3;
	Wed, 13 Nov 2024 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731521686;
	bh=tlth/xEOYB6Y5Ki7U78pP9+5Q7ncBJCFV0cKZDTpLYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZiSopK4Mfn9vu+RyK92HujgWd8nH0bcnyIwfYxYjvtGDiytu9mx4UNdFOiJWj27l
	 igzaXn8I3OT4wgfcwrNRq2i1yLz+FsCUvZLrNxbuel5Ex/44X6jjZLoTUfnDv+yXUd
	 1Yae0Aeax87AvbTsW1+qMgdXQmBn+G8sTyQvDg8SS8Esj7bCZshX46FsYpEH7lRNGd
	 Je5y1fu7THO4/jPjT6Ifv6/SraB3qb6psaPOsBTKc9UNVt9OF9yUP9PJt0J1crVssc
	 O0LPKASkWIc7X5rkG5KLwQC57kE1DEhIrbuJTp7TTdCeRTb6/oSZzqQsYAjdhvKBWz
	 uRrIJft47erSw==
Date: Wed, 13 Nov 2024 12:14:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: linux-doc@vger.kernel.org, magnus.damm@gmail.com,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux@roeck-us.net, geert+renesas@glider.be,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com
Subject: Re: [PATCH v7 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <173152167698.1019669.14314934819662197070.robh@kernel.org>
References: <cover.1731439797.git.grantpeltier93@gmail.com>
 <f7ac200e982961ff733de27a5c4505c04d68b6f3.1731439797.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7ac200e982961ff733de27a5c4505c04d68b6f3.1731439797.git.grantpeltier93@gmail.com>


On Tue, 12 Nov 2024 14:10:06 -0600, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> These bindings copy the vout-voltage-divider property defined in the
> maxim,max20730 bindings schema since it is the best fit for the use case
> of scaling hwmon PMBus telemetry. The generic voltage-divider property
> used by many iio drivers was determined to be a poor fit because that
> schema is tied directly to iio for the purpose of scaling io-channel
> voltages and the isl68137 driver is not an iio driver.
> 
> New schema file named isil,isl68137.yaml to align with the corresponding
> driver name and pre-existing bindings ported from trivial bindings.
> However, all new device bindings use renesas as the vendor prefix
> since Renesas acquired Intersil and now maintains all documentation
> for the devices.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 148 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   6 -
>  2 files changed, 148 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

