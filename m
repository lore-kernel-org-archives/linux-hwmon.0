Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFDA13D893;
	Mon,  6 Jan 2025 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175392; cv=none; b=PNpI0TLuGGDP98n32EDsvazPJOHkPpJLKA7UsTizw1zwx6l/adPy3EW0LhndafeUa40372rw3D9pmSeAnFLyP3SnUhpVV9/fqvaDDr5P7ENbknmZCWCFJMlwDK7mUMdzKUgWxs/NbBVPjQ80k0nqi85cwLtlAUV3dx7eZrz6mpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175392; c=relaxed/simple;
	bh=Di6LmjJ9gF4qTqhZHjx/v4Wweb6edJ/P+X63RD48/Y8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=I97TXFmWg1/5RRu9QzwJoI8VItTI3JQeV82YjgGZ0gGVYNWER6li7U534jfreMvGEpZOtxn1ypZZeTEUngvnt0HoaDCen7h8yPjEXnZcR5n0qG10KuGefHcP+iXh5p6eO6m/UYhTXiVh99C63ka2Fu2hmYILAkKtjCk6pSMKGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALGKh/18; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALGKh/18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD107C4CED2;
	Mon,  6 Jan 2025 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736175392;
	bh=Di6LmjJ9gF4qTqhZHjx/v4Wweb6edJ/P+X63RD48/Y8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ALGKh/18X2i9Q3c5JybYrCBw+dTCHFsLv+Ppzx9XLmb+SVXiWcDV7W65iCc9AqAcL
	 n+pR1ODa7wERwef7yp95ZYdTRjdL0eivnUSCy6MyxHyhghXMpGz1O/T+jVaLqJH+R5
	 mtw6pU91x+Yq4BzLgpw7I3QCjcmONETSmup6K10QlKgjIg/gPZwM3AVHvrkbJDeASK
	 MzCSqOI0Sfxe4vfj81q53E3ZuFJRjdPfx2DjjfjpsM137q04sJGil7tlmOb9F2SltE
	 heSNlckn6m9FHWTX1L9sK+aT7pcaUYzq0Ij5/V6ijylld4IdjwoNXu9SXHadQvf9ts
	 9dy8cVaT/i4iw==
Date: Mon, 06 Jan 2025 08:56:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Delphine_CC_Chiu@Wiwynn.com, jdelvare@suse.com, corbet@lwn.net, 
 linux-kernel@vger.kernel.org, Leo-Yang@quantatw.com, 
 linux-hwmon@vger.kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, conor+dt@kernel.org, linux@roeck-us.net
To: Leo Yang <leo.yang.sy0@gmail.com>
In-Reply-To: <20250106071337.3017926-2-Leo-Yang@quantatw.com>
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-2-Leo-Yang@quantatw.com>
Message-Id: <173617539096.200230.9323212327548655095.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add INA233 device


On Mon, 06 Jan 2025 15:13:36 +0800, Leo Yang wrote:
> Add TI INA233 Current and Power Monitor bindings.
> 
> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
> ---
>  .../bindings/hwmon/pmbus/ti,ina233.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml:35:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml:35:1: found character that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.example.dts'
Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml:35:1: found character that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250106071337.3017926-2-Leo-Yang@quantatw.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

