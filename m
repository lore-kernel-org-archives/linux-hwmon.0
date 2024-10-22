Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3513E41A;
	Tue, 22 Oct 2024 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729628882; cv=none; b=UHz64Jt3cimMBYmbO66rQS+Kat+C+ZAiMZrhnnwXJAav0qYuhX3RrJn9IUBq4u/3W0GKA7EQb9kuPADxLn8gVmYptRE4iHGyvcRrsNX2AoVofOYQgAmGhb6b54bbMmgSvNIN2yfNCoC9QaPqEiWQNP4F6PGRdoVpR7wwjm9u4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729628882; c=relaxed/simple;
	bh=eB+G15xfaY4bHAPIyob9xvK0LsnVIUuRF0OF6XIwSEQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=TI3WVxxTijB3K1sSsYjK1kVCMilrWCUBF2n1MzZpG4mIi89pXpvT1IR+brynHHs6jz9r7R354pHz0PczVUrJR5pZ2qwNQRcKmUwK90h4aOEBPyXx6CbZjD8Iy456sJuaxtZxHBiK8+1JmvbzSCam27nOs8xtbPqS3WwiLm0lkzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyA5vfY3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyA5vfY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF61C4CEC3;
	Tue, 22 Oct 2024 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729628880;
	bh=eB+G15xfaY4bHAPIyob9xvK0LsnVIUuRF0OF6XIwSEQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oyA5vfY3xmzutNmxhHDfHhD0LRUw7ZwCdefnjwc42G5VgXqDOSnSmWcd0g/XwCyOi
	 z352UWpX42p1RWHKZ3uLYJBilvmkmzDSWNxLCka1q96LMzoPN0c2vbBDOnvou5em5j
	 CC+ONX8dpGatg5e8Nw/jAfMkNndbGCTf2bRxQ3bxC+maEIJeH2gkbDd5Nlr7vprKOy
	 phBc7C6t8CU6ROL9ldCWPo23gXYavat5jlf+Li5Y87CGOKw/AIOtCTOSeCjYEF5U3c
	 JR45eOUvI3ZlA9Yw1TOF4o/5uvyTLO4JsiCdmpryhxmBnywunEVMQkwlzsossceo7r
	 ms2rIpPaqUj9A==
Date: Tue, 22 Oct 2024 15:27:59 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: brandon.howell.jg@renesas.com, linux@roeck-us.net, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 grant.peltier.jg@renesas.com, magnus.damm@gmail.com, 
 geert+renesas@glider.be, linux-hwmon@vger.kernel.org
In-Reply-To: <858d8af3ae9d15b62e36dc3deb50275f9c9869b0.1729622189.git.grantpeltier93@gmail.com>
References: <cover.1729622189.git.grantpeltier93@gmail.com>
 <858d8af3ae9d15b62e36dc3deb50275f9c9869b0.1729622189.git.grantpeltier93@gmail.com>
Message-Id: <172962887960.1517973.1871578164946455870.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers


On Tue, 22 Oct 2024 14:25:39 -0500, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../hwmon/pmbus/renesas,isl68137.yaml         | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml: properties:compatible:enum: ['renesas,isl68137', 'renesas,isl68137', 'renesas,isl68220', 'renesas,isl68221', 'renesas,isl68222', 'renesas,isl68223', 'renesas,isl68224', 'renesas,isl68225', 'renesas,isl68226', 'renesas,isl68227', 'renesas,isl68229', 'renesas,isl68233', 'renesas,isl68239', 'renesas,isl69222', 'renesas,isl69223', 'renesas,isl69224', 'renesas,isl69225', 'renesas,isl69227', 'renesas,isl69228', 'renesas,isl69234', 'renesas,isl69236', 'renesas,isl69239', 'renesas,isl69242', 'renesas,isl69243', 'renesas,isl69247', 'renesas,isl69248', 'renesas,isl69254', 'renesas,isl69255', 'renesas,isl69256', 'renesas,isl69259', 'renesas,isl69260', 'renesas,isl69268', 'renesas,isl69269', 'renesas,isl69298', 'renesas,raa228000', 'renesas,raa228004', 'renesas,raa228006', 'renesas,raa228228', 'renesas,raa229001', 'renesas,raa229004'] has non-unique elements
	hint: "enum" must be an array of either integers or strings
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml: $id: 'http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml: ^channel@([0-3])$: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/858d8af3ae9d15b62e36dc3deb50275f9c9869b0.1729622189.git.grantpeltier93@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

