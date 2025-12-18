Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883332F757;
	Thu, 18 Dec 2025 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046334; cv=none; b=BjrGCumtMvJFLTFyoyV86SY+Lq/j8OiaDgJqO5J4gzsUQvygTFMFFfcT4Y5Xuu9t4fuskeBSgTivOvgs8dc7TdDdXsz5vZa12NaiScIKCaXHAvPUB8A43v7+39LB+SsatZGza9InIubyMRzKjq08/lQmtscddEeybIWF+NFrP74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046334; c=relaxed/simple;
	bh=ooSNugRvqxRhSfkhz9jyqwktnaQTCnqN7VNCMHtGxj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZfZuaHHy0ASLEeo0jszsqvt8CE9K8K90D7d8A2tO6VuWG9+yHoxSfJ4bNF2DLgS7E+KiaxNLslbvkEtRZr1varKB+9cmhc0UvEFZixi06C+fvOowtGVo7kcWnkS/03bto7G99l4uqlrmvF49qxAZkm8tXULlLj93lPAOFH2vwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBS3d1ZY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBS3d1ZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D73C4CEFB;
	Thu, 18 Dec 2025 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046334;
	bh=ooSNugRvqxRhSfkhz9jyqwktnaQTCnqN7VNCMHtGxj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBS3d1ZYYXIQnEBKDfyDrlh6vRkSdmSLhavNNKTFzRrJXJMYIBZJjOLZYa53nwb+b
	 b+qKnGyF0LkttUth67FRSu1IhOFTDq7yrx0BzievTRYQJobY2Hdr7hxoYKN0ZrJh3F
	 nEIWCqjko7K8kup2YUVc6vRIvNBujTAYjWq3eCAE2PqCnS6Xbr8psMCvx4y2Eq1L+M
	 StST+RkjFh1A1g6+LSs5u9vOZ//mTKWvVowtOTk258/mft5/R3vCaoPKhkYPtmuj+/
	 LVtKPMAZeBy/+oDaVrxBx7/slFl0mbZH4M+50jhMDD/O69sn6xgY9+3H2DBztu6HjB
	 jeA2H4HrqOCIg==
Date: Thu, 18 Dec 2025 09:25:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammadamirulasyraf.mohamadjamian@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ang Tien Sung <tien.sung.ang@altera.com>, 
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: hwmon: add altr,socfpga-hwmon.yaml
 binding
Message-ID: <20251218-gigantic-neat-lion-b30ad5@quoll>
References: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
 <20251216064926.15817-2-muhammadamirulasyraf.mohamadjamian@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251216064926.15817-2-muhammadamirulasyraf.mohamadjamian@altera.com>

On Mon, Dec 15, 2025 at 10:49:22PM -0800, muhammadamirulasyraf.mohamadjamia=
n@altera.com wrote:
> From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.moham=
ad.jamian@altera.com>
>=20
> The Altera SoCFPGA platform includes a hardware monitoring (hwmon) device
> that reports voltage and temperature sensors critical for system stability
> and safety. Without a proper device tree binding, the kernel and
> userspace tools cannot correctly interpret or configure these sensors.
>=20
> This binding provides a formal description of the device=E2=80=99s proper=
ties,
> including the 'compatible' string for driver matching, voltage and
> temperature parameters with scaling and threshold definitions. This enabl=
es
> the kernel to correctly identify the device, interpret sensor data
> accurately, and manage threshold-based events.
>=20
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asy=
raf.mohamad.jamian@altera.com>

Please use consistent emails - this does not match sender.

> ---
>  .../bindings/hwmon/altr,socfpga-hwmon.yaml    | 286 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 293 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/altr,socfpga-=
hwmon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.y=
aml b/Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
> new file mode 100644
> index 000000000000..b69611c8bc7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
> @@ -0,0 +1,286 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/altr,socfpga-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera Hardware monitor SOC FPGA

"Monitor SoC"

> +
> +maintainers:
> +  - Ang Tien Sung <tiensung.ang@altera.com>
> +  - Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohama=
d.jamian@altera.com>
> +
> +description: |
> +  The Altera SoC FPGA hardware monitor unit provides on-chip voltage and
> +  temperature sensors. You can use these sensors to monitor external
> +  voltages and on-chip operating conditions such as internal power rails
> +  and on-chip junction temperatures.
> +
> +  The specific sensor configurations vary for each device family and
> +  each device within a family does not offer all potential sensor
> +  options. The information below attempts to illustrate the super set of
> +  possible sensor options that are potentially available within each
> +  device family, but the user should check the documentation for the
> +  specific device they are using to verify which sensor options it
> +  actually provides.
> +
> +  Stratix 10 Device Family
> +
> +    Stratix 10 Voltage Sensors
> +
> +      page 0, channel 2 =3D 0.8V VCC
> +      page 0, channel 3 =3D 1.8V VCCIO_SDM
> +      page 0, channel 6 =3D 0.9V VCCERAM
> +
> +    Stratix 10 Temperature Sensors
> +
> +      page 0, channel 0 =3D main die
> +      page 0, channel 1 =3D tile bottom left
> +      page 0, channel 2 =3D tile middle left
> +      page 0, channel 3 =3D tile top left
> +      page 0, channel 4 =3D tile bottom right
> +      page 0, channel 5 =3D tile middle right
> +      page 0, channel 6 =3D tile top right
> +      page 0, channel 7 =3D hbm2 bottom
> +      page 0, channel 8 =3D hbm2 top
> +
> +  Agilex Device Family
> +
> +    Agilex Voltage Sensors
> +
> +      page 0, channel 2 =3D 0.8V VCC
> +      page 0, channel 3 =3D 1.8V VCCIO_SDM
> +      page 0, channel 4 =3D 1.8V VCCPT
> +      page 0, channel 5 =3D 1.2V VCCRCORE
> +      page 0, channel 6 =3D 0.9V VCCH
> +      page 0, channel 7 =3D 0.8V VCCL
> +
> +    Agilex Temperature Sensors
> +
> +      page 0, channel 0 =3D main die sdm max
> +      page 0, channel 1 =3D main die sdm 1
> +
> +      page 1, channel 0 =3D main die corner bottom left max
> +      page 1, channel 1 =3D main die corner bottom left 1
> +      page 1, channel 2 =3D main die corner bottom left 2
> +
> +      page 2, channel 0 =3D main die corner top left max
> +      page 2, channel 1 =3D main die corner top left 1
> +      page 2, channel 2 =3D main die corner top left 2
> +
> +      page 3, channel 0 =3D main die corner bottom right max
> +      page 3, channel 1 =3D main die corner bottom right 1
> +      page 3, channel 2 =3D main die corner bottom right 2
> +
> +      page 4, channel 0 =3D main die corner top right max
> +      page 4, channel 1 =3D main die corner top right 1
> +      page 4, channel 2 =3D main die corner top right 2
> +
> +      page 5, channel 0 =3D tile die bottom left max
> +      page 5, channel 1 =3D tile die bottom left 1
> +      page 5, channel 6..2 =3D tile die bottom left 6..2 R-tile only
> +      page 5, channel 5..2 =3D tile die bottom left 5..2 F-tile only
> +      page 5, channel 4..2 =3D tile die bottom left 4..2 E-tile only
> +
> +      page 7, channel 0 =3D tile die top left max
> +      page 7, channel 1 =3D tile die top left 1
> +      page 7, channel 6..2 =3D tile die top left 6..2 R-tile only
> +      page 7, channel 5..2 =3D tile die top left 5..2 F-tile only
> +      page 7, channel 4..2 =3D tile die top left 4..2 E-tile only
> +
> +      page 8, channel 0 =3D tile die bottom right max
> +      page 8, channel 1 =3D tile die bottom right 1
> +      page 8, channel 6..2 =3D tile die bottom right 6..2 R-tile only
> +      page 8, channel 5..2 =3D tile die bottom right 5..2 F-tile only
> +      page 8, channel 4..2 =3D tile die bottom right 4..2 E-tile only
> +
> +      page 10, channel 0 =3D tile die top right max
> +      page 10, channel 1 =3D tile die top right 1
> +      page 10, channel 6..2 =3D tile die top right 6..2 R-tile only
> +      page 10, channel 5..2 =3D tile die top right 5..2 F-tile only
> +      page 10, channel 4..2 =3D tile die top right 4..2 E-tile only
> +
> +  N5X Device Family
> +
> +    N5X Voltage Sensors
> +
> +      page 0, channel 2 =3D 0.8V VDD
> +      page 0, channel 3 =3D 0.8V VDD_SDM
> +      page 0, channel 4 =3D 1.8V VCCADC
> +      page 0, channel 5 =3D 1.8V VCCPD
> +      page 0, channel 6 =3D 1.8V VCCIO_SDM
> +      page 0, channel 7 =3D 0.8V VDD_HPS
> +
> +    N5X Temperature Sensors
> +
> +      page 0, channel 0 =3D main die
> +
> +properties:
> +

No blank line

> +  compatible:
> +    const: altr,socfpga-hwmon

No, look at other bindings. You need soc specific compatibles.

> +
> +  temperature:
> +    description:
> +      The temperature node specifies mappings of temperature sensor diod=
es on
> +      the SoC FPGA main die and tile die.
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +    patternProperties:
> +      "^input(@[0-9a-f]+)?$":
> +        description:
> +          The input node specifies each individual temperature sensor.
> +        type: object
> +        properties:
> +          reg:
> +            description:
> +              The temperature sensor address format contains a page numb=
er and
> +              a channel number to identify a specific temperature sensor=
=2E The
> +              page number selects the region of the device that the sens=
or
> +              resides. The channel number selects the temperature sensor=
 diode
> +              in the page. The page number is defined in the upper 16-bi=
ts of
> +              the reg value while the channel number is defined in the l=
ower
> +              16-bits of the reg value. Channel 0 is represented by the =
value 0
> +              and channel 1 is represented by the value 1, and so on.
> +          label:
> +            description:
> +              A label to describe the sensor.
> +        required:
> +          - reg
> +        additionalProperties: false
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +    additionalProperties: false

None of above is readable. Why are you sending completely different code
than what we have in the kernel?


> +
> +  voltage:
> +    description:
> +      The voltage node specifies mappings of voltage sensorson the SoC F=
PGA
> +      analog to digital converter of the Secure Device Manager(SDM).
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +    patternProperties:
> +      "^input(@[0-9a-f]+)?$":
> +        description:
> +          The input node specifies each individual voltage sensor.
> +        type: object
> +        properties:
> +          reg:
> +            description:
> +              The voltage sensor address format contains a channel numbe=
r to
> +              identify a specific voltage sensor. The channel number is =
defined
> +              in the lower 16-bits of the reg value. Channel 0 is repres=
ented by
> +              the value 0 and channel 1 is represented by the value 1, a=
nd so
> +              on.
> +          label:
> +            description:
> +              A label to describe the sensor.
> +        required:
> +          - reg
> +        additionalProperties: false
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    temp_volt {

No, don't send us downstream code. Look at upstream how this is called.

Read carefully writing bindings and writing schema doc. You sent
something really needing internal review before posting.

It's another example of recently poor submissions from Altera. I am
getting tired of pointing out the same problem - you do not perform
internal review prior posting.

Is anyone from Altera going to respond on this? If not, I will just be
grumpy NAKing your patches, because such way you just waste community's
time.

Best regards,
Krzysztof

