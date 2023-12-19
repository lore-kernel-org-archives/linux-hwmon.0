Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0D134A7;
	Tue, 19 Dec 2023 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzAlkfu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3B5C433C7;
	Tue, 19 Dec 2023 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702977752;
	bh=Ku+8/L6tx5nfCW103rlyrYwhlGGJdpQu9+X71/KZcZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VzAlkfu9Z3REtUNRksAUp5mq8Kx+eq8xN/cAgwUrhypFCcUL+uBOGSk7BtW1M8V3j
	 rDqotlZGdWHGjCU1+Yk19hAyCJQTKMhFUVaV3kJQcuwvE7YKQJ6Ncqk769H4eF1kPd
	 xp8n00F2QY2uR2DHIb38GCqlVa1tcBqifkuNjAChGh2T6RmdR7eVEGX65V+LgPaLXY
	 oFlyqCjxQX5GGZNhTeMStBBzabNr8RK7s0xbk9GrMZh6o6bSvrZy8oghbIsQG3Qfim
	 oKpmeaY5uEXOcD40NnROG8gn6IZG70q8Qq6NOvx++xC9/x1Rrixkz22H4QCM+iXx+t
	 wnkp8qRObiZ4g==
Received: (nullmailer pid 1297834 invoked by uid 1000);
	Tue, 19 Dec 2023 09:22:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: baneric926@gmail.com
Cc: devicetree@vger.kernel.org, corbet@lwn.net, kwliu@nuvoton.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jdelvare@suse.com, kcfeng0@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, Bonnie_Lo@wiwynn.com, conor+dt@kernel.org, DELPHINE_CHIU@wiwynn.com, linux@roeck-us.net
In-Reply-To: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
References: <20231219080021.2048889-1-kcfeng0@nuvoton.com>
 <20231219080021.2048889-2-kcfeng0@nuvoton.com>
Message-Id: <170297774900.1297817.5593278746406765111.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Tue, 19 Dec 2023 03:22:29 -0600


On Tue, 19 Dec 2023 16:00:20 +0800, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> Adding bindings for the Nuvoton NCT7363Y Fan Controller
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---
>  .../bindings/hwmon/nuvoton,nct7363.yaml       | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/hwmon/fan-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: False schema does not allow {'pwms': [[1, 0, 50000]], 'tach-ch': ['']}
	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: False schema does not allow {'pwms': [[1, 1, 50000]], 'tach-ch': b'\x01'}
	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: fan-1: tach-ch: b'\x01' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml
MAINTAINERS: Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231219080021.2048889-2-kcfeng0@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

