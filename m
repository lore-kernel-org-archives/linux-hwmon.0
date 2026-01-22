Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B1D33D50B;
	Thu, 22 Jan 2026 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108036; cv=none; b=D6Li06Xf8Es2BwOtI8ATY9+DJ6lobKSkWqrNOJbQVSiW6lFhFVqopk8+rTH+FF3arOiZCrUVuJhUIrRMHL3F6KMCL+ONPowEiHmKKHdinOf61QS19lvIhQSJhZWrOw5rPMnLT9VCzQ2KfZmB5ibFmoqH88Nx9stLAyJUTc35VCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108036; c=relaxed/simple;
	bh=x+vJTzPFmv8EobBtXAeiFK68tJs2Asg7hvwRbt3g3lE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qf7bdvDwRRuA/EpQqj2RBX1ZFKZhjtL3KPa1+f1Ur7IJD3lbeQmqBsuJqCCE6SunNGeVGsQNeJjF4Ta9DIXMQzoQd5d0PyhTwHc41vggLUF69RCOWhtaXtAIg8W/dNxjLAorIE3ZaSQYIDeWA4spwuqxLbVVFeZqqRcIJ6ZD+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Oo9hUBwc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AFtbkyGR; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Oo9hUBwc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AFtbkyGR"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 534EC1D00150;
	Thu, 22 Jan 2026 13:53:42 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 22 Jan 2026 13:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769108022;
	 x=1769194422; bh=DV3zeDN5fR2PN1PyGfPOC30rsTRCeFxJKjTzkPNJZc4=; b=
	Oo9hUBwc5NFr23z0JV83eEV0SqIKIF7ciDxOlZjl9+B8O3oSr1Olo2RmpX4fUbGD
	1tcSMzFtmxBvEZw3wsktqtpABnwBQ9dnaS3LcVtadIdwpjkA0CgXpvro9d/u2xO0
	anNhUuFDRhMr76bONt1PLEhDBz3GDHNURPiVbpN3J5/cKP4yvLjLHDrGLGNqXwRh
	Vdii3o96B0xPNv74CupKRHQHwzKSaS+oIeSUciPNBZquI8t1fjlRqjyXBRRZwkps
	YRXvs0IEoSv9Lxlilgyr03yR9u4frQtGrb3tW1RY1Ai2+rj5q1VpxUkEDqBj1G8F
	BmiaJV5B+Tm4QGiLZMppWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769108022; x=
	1769194422; bh=DV3zeDN5fR2PN1PyGfPOC30rsTRCeFxJKjTzkPNJZc4=; b=A
	FtbkyGR6JzFHXoC1HlTKgU9iQZgAg678f5DxjlZ+9UToloH1rKxq4tXKvZlD0pf0
	p3W0oDlsAxqpI/z7WbbgWqpoVGolXvr0vGf9EuqS4iUCvouJvue1eXUpNbDlQPBR
	qsRjMhFwUg8mUmOtWrJ/99Hy9YGOwP56z2jCJd4UwL2MPvUoAzFv2A62eeDqq+8G
	lgpui7WBpyvPXlzwnsl9fk3Q5dmkI1+UUUMc0FjERDxnWtn/qFjqlwBQkNNOca7w
	jYJRm/RSh5FYluT9NYgE1EjkWhx0M4iVudxQ/BfTqGWfkvIHPfKcVmAAnLpOKjmR
	lzvr0K8Llf8U7+w6BL4Yw==
X-ME-Sender: <xms:NnJyadT0u98yqmYE_EoCR80NoEvuoO0gzxAAJFQzkfAHyxYFVTe6Cw>
    <xme:NnJyaRmK_IcsZdtRtJIGhiREtkH-Fkzr_ikJtVSaXg1yreeNvHgzpUWi1LO-P-UgD
    Fami5SctjV48SR0RyoQC78FidX9o4--bcba4Kp0EIw2_0AT6y7O0fA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeileefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeffuefgfeetleegtdejjeevhfevhfdvhedtheeltedt
    veethfejudeiffduleffhfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddtpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepkhhuuhhrthgssehgmhgrihhlrdgtohhmpdhrtghpth
    htohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohephhgrnhhsgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdp
    rhgtphhtthhopehisehrohhnghdrmhhovgdprhgtphhtthhopehlihhnuhigqdhhfihmoh
    hnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NnJyaYdQpar_VwmKdocq9oLXz3GqOeRmnvUe77kZBjyi7LPw7X7AjA>
    <xmx:NnJyaYcZqd-WU8wamkAjkGbrKjmEZ7f4z8RX9f4JRHWS9UyWCLM6hA>
    <xmx:NnJyaS1ssbmuHZfS_2cem4uQmX_5_tss9gJsuaaE7VnSANm_ECTR2w>
    <xmx:NnJyaQ9QHC4LBT9lQVDDN1attUw3jya7X4F7P2PNTzf5888gQ225pg>
    <xmx:NnJyacJUU3827tzy9WGRTd52MVQA3gcBHxq2evBp5Ov2TQxkrcdb54os>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A4C32CE0072; Thu, 22 Jan 2026 13:53:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Abm1d4JRfde3
Date: Thu, 22 Jan 2026 13:53:21 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Message-Id: <514630cc-0eed-49b1-90a0-a81b725294c4@app.fastmail.com>
In-Reply-To: <20260120182104.163424-6-i@rong.moe>
References: <20260120182104.163424-1-i@rong.moe>
 <20260120182104.163424-6-i@rong.moe>
Subject: Re: [PATCH v11 5/7] platform/x86: lenovo-wmi-capdata: Add support for Fan Test
 Data
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Jan 20, 2026, at 1:20 PM, Rong Zhang wrote:
> Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> interface for querying the min/max fan speed RPM (reference data) of a
> given fan ID.
>
> This interface is optional. Hence, it does not bind to lenovo-wmi-other
> and is not registered as a component for the moment. Appropriate bindi=
ng
> will be implemented in the subsequent patch.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v11:
> - Adopt a unified name (lenovo_wmi_capdata) for kmod, Kconfig, export
>   namespace and driver (thanks Ilpo J=C3=A4rvinen)
>
> Changes in v8:
> - Fix missing #include (thanks Ilpo J=C3=A4rvinen)
>
> Changes in v7:
> - Rearrange lwmi_cd_fan_list_alloc_cache() to drop gotos (thanks Ilpo
>   J=C3=A4rvinen)
> - Move the declarations of __free()-managed variablesto where thet are
>   assigned (ditto)
> - Prevent back-and-forth changes (ditto)
> - Improve the readablity of struct definition (ditto)
> - Emit unaligned access to the WMI block
> - Properly calculate array index when we truncate the data
>
> Changes in v4:
> - Rebase on top of changes made to [PATCH v4 3/7]
> - Do not register it as a component until [PATCH v4 6/7]
>
> Changes in v2:
> - Reword documentation
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          | 17 ++++
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 97 +++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  7 ++
>  3 files changed, 121 insertions(+)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst=20
> b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index fcad595d49af2..821282e07d93c 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
>=20
> +LENOVO_FAN_TEST_DATA
> +-------------------------
> +
> +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> +
> +The LENOVO_FAN_TEST_DATA interface provides reference data for self-t=
est of
> +cooling fans.
>=20
>  WMI interface description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> @@ -115,3 +122,13 @@ data using the `bmfdec=20
> <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
>      [WmiDataId(4), read, Description("Default Value"),=20
> WmiSizeIs("DataSize")] uint8 DefaultValue[];
>    };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> Description("Definition of Fan Test Data"),=20
> guid("{B642801B-3D21-45DE-90AE-6E86F164FB21}")]
> +  class LENOVO_FAN_TEST_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
> +    [WmiDataId(2), read, Description("Fan ID."),=20
> WmiSizeIs("NumOfFans")] uint32 FanId[];
> +    [WmiDataId(3), read, Description("Maximum Fan Speed."),=20
> WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
> +    [WmiDataId(4), read, Description("Minumum Fan Speed."),=20
> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
> +  };
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c=20
> b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 4ed5b73d430dc..478b00bc66c4c 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -13,6 +13,10 @@
>   * attribute has multiple pages, one for each of the thermal modes=20
> managed by
>   * the Gamezone interface.
>   *
> + * Fan Test Data includes the max/min fan speed RPM for each fan. Thi=
s=20
> is
> + * reference data for self-test. If the fan is in good condition, it=20
> is capable
> + * to spin faster than max RPM or slower than min RPM.
> + *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
>   *
> @@ -32,6 +36,7 @@
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/mutex_types.h>
> @@ -45,6 +50,7 @@
>=20
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD=
5BB300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
> +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB=
21"
>=20
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
> @@ -52,6 +58,7 @@
>  enum lwmi_cd_type {
>  	LENOVO_CAPABILITY_DATA_00,
>  	LENOVO_CAPABILITY_DATA_01,
> +	LENOVO_FAN_TEST_DATA,
>  };
>=20
>  #define LWMI_CD_TABLE_ITEM(_type)		\
> @@ -66,6 +73,7 @@ static const struct lwmi_cd_info {
>  } lwmi_cd_table[] =3D {
>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> +	LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
>  };
>=20
>  struct lwmi_cd_priv {
> @@ -82,6 +90,7 @@ struct cd_list {
>  	union {
>  		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
>  		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> +		DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
>  	};
>  };
>=20
> @@ -121,6 +130,10 @@ void lwmi_cd_match_add_all(struct device *master,=20
> struct component_match **match
>  		return;
>=20
>  	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> +		/* Skip sub-components. */
> +		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> +			continue;
> +
>  		component_match_add(master, matchptr, lwmi_cd_match,
>  				    (void *)&lwmi_cd_table[i].type);
>  		if (IS_ERR(*matchptr))
> @@ -200,6 +213,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data,=20
> "LENOVO_WMI_CAPDATA");
>  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct=20
> capdata01);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
>=20
> +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_f=
an);
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
> +
>  /**
>   * lwmi_cd_cache() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -223,6 +239,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  		p =3D &priv->list->cd01[0];
>  		size =3D sizeof(priv->list->cd01[0]);
>  		break;
> +	case LENOVO_FAN_TEST_DATA:
> +		/* Done by lwmi_cd_alloc() =3D> lwmi_cd_fan_list_alloc_cache(). */
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -245,6 +264,72 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
>  	return 0;
>  }
>=20
> +/**
> + * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
> + * @priv: lenovo-wmi-capdata driver data.
> + * @listptr: Pointer to returned cd_list pointer.
> + *
> + * Return: count of fans found, or an error.
> + */
> +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv,=20
> struct cd_list **listptr)
> +{
> +	struct cd_list *list;
> +	size_t size;
> +	u32 count;
> +	int idx;
> +
> +	/* Emit unaligned access to u8 buffer with __packed. */
> +	struct cd_fan_block {
> +		u32 nr;
> +		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> +	} __packed * block;
> +
> +	union acpi_object *ret_obj __free(kfree) =3D=20
> wmidev_block_query(priv->wdev, 0);
> +	if (!ret_obj)
> +		return -ENODEV;
> +
> +	if (ret_obj->type =3D=3D ACPI_TYPE_BUFFER) {
> +		block =3D (struct cd_fan_block *)ret_obj->buffer.pointer;
> +		size =3D ret_obj->buffer.length;
> +
> +		count =3D size >=3D sizeof(*block) ? block->nr : 0;
> +		if (size < struct_size(block, data, count * 3)) {
> +			dev_warn(&priv->wdev->dev,
> +				 "incomplete fan test data block: %zu < %zu, ignoring\n",
> +				 size, struct_size(block, data, count * 3));
> +			count =3D 0;
> +		} else if (count > U8_MAX) {
> +			dev_warn(&priv->wdev->dev,
> +				 "too many fans reported: %u > %u, truncating\n",
> +				 count, U8_MAX);
> +			count =3D U8_MAX;
> +		}
> +	} else {
> +		/*
> +		 * This is usually caused by a dummy ACPI method. Do not return an=20
> error
> +		 * as failing to probe this device will result in sub-master device=20
> being
> +		 * unbound. This behavior aligns with lwmi_cd_cache().
> +		 */
> +		count =3D 0;
> +	}
> +
> +	list =3D devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan,=20
> count), GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
> +	for (idx =3D 0; idx < count; idx++) {
> +		/* Do not calculate array index using count, as it may be truncated=
.=20
> */
> +		list->cd_fan[idx] =3D (struct capdata_fan) {
> +			.id      =3D block->data[idx],
> +			.max_rpm =3D block->data[idx + block->nr],
> +			.min_rpm =3D block->data[idx + (2 * block->nr)],
> +		};
> +	}
> +
> +	*listptr =3D list;
> +	return count;
> +}
> +
>  /**
>   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -270,6 +355,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv=20
> *priv, enum lwmi_cd_type type)
>  	case LENOVO_CAPABILITY_DATA_01:
>  		list_size =3D struct_size(list, cd01, count);
>  		break;
> +	case LENOVO_FAN_TEST_DATA:
> +		count =3D lwmi_cd_fan_list_alloc_cache(priv, &list);
> +		if (count < 0)
> +			return count;
> +
> +		goto got_list;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -278,6 +369,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv=
,=20
> enum lwmi_cd_type type)
>  	if (!list)
>  		return -ENOMEM;
>=20
> +got_list:
>  	ret =3D devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
>  	if (ret)
>  		return ret;
> @@ -396,6 +488,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev,=20
> const void *context)
>=20
>  		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>  		goto out;
> +	case LENOVO_FAN_TEST_DATA:
> +		goto out;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -419,6 +513,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  	case LENOVO_CAPABILITY_DATA_01:
>  		component_del(&wdev->dev, &lwmi_cd_component_ops);
>  		break;
> +	case LENOVO_FAN_TEST_DATA:
> +		break;
>  	default:
>  		WARN_ON(1);
>  	}
> @@ -431,6 +527,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
>  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
>  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> +	{ LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
>  	{}
>  };
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h=20
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> index a6d006ef458f6..38af4c4e4ef4b 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -26,6 +26,12 @@ struct capdata01 {
>  	u32 max_value;
>  };
>=20
> +struct capdata_fan {
> +	u32 id;
> +	u32 min_rpm;
> +	u32 max_rpm;
> +};
> +
>  struct lwmi_cd_binder {
>  	struct cd_list *cd00_list;
>  	struct cd_list *cd01_list;
> @@ -34,5 +40,6 @@ struct lwmi_cd_binder {
>  void lwmi_cd_match_add_all(struct device *master, struct=20
> component_match **matchptr);
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata01 *output);
> +int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id,=20
> struct capdata_fan *output);
>=20
>  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> --=20
> 2.51.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
