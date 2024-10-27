Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDA257C9F;
	Sun, 27 Oct 2024 23:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730070112; cv=none; b=pp70ybxNyJvZOoBrRA9weFM8v8U2oo32LmFeUQT3qz047CZxh5oWNZYPslPpbmbzn/Bu4GV0LuOkfyUgw5muq+kLsOKl+ZOvTmGVMuxz0bljp4ejpYD5riFtbSRmjrkBR6R3ArDUq8uHEGpzdOyETUsms1rFH7zB353NX2o4woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730070112; c=relaxed/simple;
	bh=pjTcQxgrNOe7nu1x7YejBgUbsxFEPWbjcuUJFrSfjMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3hGqmNSRC5p+foVYcjEo9Tym4ng4xQGNCQHO2j9//F7sHl2oWOzRPqh0rVwFpnR6fTcwaX7xQVYlzKRhKWLoI/BzIW5JCny2nYw27aXbwZEIbsFG35/8LGf8HexmmSzTFv50VUDftVbCAT3a8X6FacFoPF9dgo6iW79ArKCClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxexDpKv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxexDpKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E09C4CEC3;
	Sun, 27 Oct 2024 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730070112;
	bh=pjTcQxgrNOe7nu1x7YejBgUbsxFEPWbjcuUJFrSfjMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxexDpKvMsPyMAgv7621a0tr0Du3eac6OapqT+IUinF4ATcg45HOPhcQLNHadmPUY
	 yMJX9QjI7zMciEgNce6yPQ7WUujliHvYWoe3hwMJ3Q8LLO0vK001LxiQQwu3W4zGOi
	 LKVEuZy0G3iU5xf7ZdkRGfSSlDj7WZeYPfodnFq2bYa90dTOMJrQ5bjPlJvJy7+yH7
	 AxzGZS9t3LB7Skurun+5lkWXTNYNlD9LF9Bzx0HHftGDOYAoIgU2v1dvOOlHipcq6p
	 oObxuGlcrUOQbrEEnPpzu622QPYH1aVFWsxWORJDYn0udldW8/xM9LbgbEPmXRyIMu
	 vOWzUKs8y6uGw==
Date: Sun, 27 Oct 2024 18:01:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net,
	brandon.howell.jg@renesas.com, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, geert+renesas@glider.be,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <173007007071.202481.10271317017452995463.robh@kernel.org>
References: <cover.1729874904.git.grantpeltier93@gmail.com>
 <42eadc3942a70bef73ecdf601459aa8b9ea0bcaa.1729874904.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42eadc3942a70bef73ecdf601459aa8b9ea0bcaa.1729874904.git.grantpeltier93@gmail.com>


On Fri, 25 Oct 2024 12:17:28 -0500, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

