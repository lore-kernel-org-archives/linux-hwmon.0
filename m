Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1270E18D658;
	Tue, 25 Nov 2025 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764036559; cv=none; b=ZczOozeSSnEfKVS2KCLsljgEAAiG/ylMN5F8SGizp6fy25w8luZV2w/msa+P/wte7bUMCeZhdj8VXlN9ADypaHtBee5uWG8Ed12tGSJL2zTXlNgpGuc2/CA9Iq0FIy7EK4uFcQTYbtDGAPUJT5frEuUkk0JBFz7JsHXRjNSYqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764036559; c=relaxed/simple;
	bh=+TYBIjoBi9lnpfnXvICc38HO0+Peh5kHx/gwcvKjdDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxyXxAjBD8Z8IJtWWEFfMIz8IfWm4UYBwxdhrPcrC+AJMMmKQlZsZLhx2Le02teqGXE2O4f9KI+r8CPHafw/hm/LYe3cgNOlQwMwGjlf4D5rSL/++OidwoGl9NKG5jddTFA1Z7EVt8NvS96b0ICptgG9C0f0ASsZff4GsVs1l5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tpDc8p5c; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tpDc8p5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764036538; x=1764641338; i=w_armin@gmx.de;
	bh=Ql80EbH3blCGhYrjtFqKHCkjf+IAqtxOfZo9rLpOt40=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tpDc8p5cVOFV5mdffQsRUeKGuhrwdIsHf2mJYCJg9gdZOSbsYrNM+LKR6DH9zFLe
	 5TKJrIsKgwc9QKv4DA5Tq5063dhjwiPEXu+IrCw4FlT79vxG1PFo5EZW3yUlrsIoK
	 TOB73yZeLhYD3R1WGuEpB+gVSSG8SkgBMYKoTIsiBg50POkha+itWMF0ChT+cGQAt
	 HgWKakG3t0J0MT8z4aa/NClqVX6ZiCnBkKnv+cVtUu8OOTLRZD6CevX5Rs9vDJ4Cd
	 zQASjtpHHjs5cnSoDEP1+BSO4z7nNYl+I8v4jcwmEk5uXvMMj1P5oUoMoYncSeywV
	 cPe81mQy5KgWYGxn0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1vvRSd2jTG-00kVGD; Tue, 25
 Nov 2025 03:08:57 +0100
Message-ID: <61e17bf7-b549-4345-9d4f-be14e13b34af@gmx.de>
Date: Tue, 25 Nov 2025 03:08:55 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan Test
 Data
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20251122184522.18677-1-i@rong.moe>
 <20251122184522.18677-7-i@rong.moe>
 <9340b459-2d25-4767-8a47-765a71477d8f@gmx.de>
 <667b29838d39f7bac2a754c4f0720e33ead556f8.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <667b29838d39f7bac2a754c4f0720e33ead556f8.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SrFKFDR3PLZfUOCdCC+wDmQC5ID2cxiKnpM2B0jYDv11oE/Go6C
 KYn07kAIpLbGwC14O9pf/rMt3RiAg1OYUdzPE8a32tvS2ijv6/CHpp4hSL7tf2dyR52iGXS
 i1s+7FWzpOzpmBJQqdc1oF8/mghryLOD9Z3OhjtHUYsZ0I4ThsJSqTvP3SAjOxLYqZYPOi0
 AWlCv4hqz8UKCeWhUqRYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1vXwQyIMuXE=;Scey56EUZIYv95y+6PzlGrYnZHv
 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
 HCsxtMadbUYan4QxJXOj4NwdS3vBf

Am 23.11.25 um 16:02 schrieb Rong Zhang:

> Hi Armin,
>
> On Sun, 2025-11-23 at 04:36 +0100, Armin Wolf wrote:
>> Am 22.11.25 um 19:44 schrieb Rong Zhang:
>>
>>> A capdata00 attribute (0x04050000) describes the presence of Fan Test
>>> Data. Query it, and bind Fan Test Data as a component of capdata00
>>> accordingly. The component master of capdata00 may pass a callback whi=
le
>>> binding to retrieve fan info from Fan Test Data.
>>>
>>> Summarizing this scheme:
>>>
>>> 	lenovo-wmi-other <-> capdata00 <-> capdata_fan
>>> 	|- master            |- component
>>> 	                     |- sub-master
>>> 	                                   |- sub-component
>>>
>>> The callback will be called once both the master and the sub-component
>>> are bound to the sub-master (component).
>>>
>>> This scheme is essential to solve these issues:
>>> - The component framework only supports one aggregation per master
>>> - A binding is only established until all components are found
>>> - The Fan Test Data interface may be missing on some devices
>>> - To get rid of queries for the presense of WMI GUIDs
>>>
>>> capdata00 is registered as a component and a sub-master on probe,
>>> instead of chaining the registerations in one's bind callback. This is
>>> because calling (un)registration methods of the component framework
>>> causes deadlock in (un)bind callbacks, i.e., it's impossible to regist=
er
>>> capdata00 as a sub-master/component in its component/sub-master bind
>>> callback, and vice versa.
>> I spend some time trying to understand all of this, and i have come to =
the conclusion
>> that while passing a callback between both component masters, it still =
is not exactly
>> clean.
> Could you elaborate? Thanks.
>
>> Can you instead use devm_lwmi_om_register_notifier() and define another=
 event for querying
>> the fan data? This way we could ditch the component submaster with all =
of the callback madness.
> Thanks for your review and suggestion.
>
> At first I thought the notifier approach was nice, however...
>
> There are two directions to use the notifier framework:
> (1) lenovo-wmi-other calls blocking_notifier_call_chain() to query
>      capdata_fan
> (2) capdata_fan calls blocking_notifier_call_chain() to provide data
>      to lenovo-wmi-other
>
> Both requires some assumptions on probing/binding sequence:
> (1) capdata_fan must be probed before lenovo-wmi-other calling
>      blocking_notifier_call_chain(), otherwise lenovo-wmi-other will
>      mistakenly believe capdata_fan is missing
> (2) lenovo-wmi-other must be probed before capdata_fan calling
>      blocking_notifier_call_chain(), otherwise lenovo-wmi-other will
>      wait for fan info forever
>
> So eventually we need *both directions* to break the assumptions on
> probing/binding sequence. Moreover, some extra synchronization
> primitives may be required to make sure the binding between lenovo-wmi-
> other and capdata00&01 won't be unbind while registering the HWMON
> device.
>
>> Sorry for being the one for suggesting the submaster approach in the fi=
rst place, i did not
>> know that the component framework is so limited when it comes to nested=
 component masters :/
> I'd say the sub-master approach is still the least ugly one.
>
> The callback is always called in a bind callback. Hence, the component
> framework protects our sanity, so we don't need to worry about the
> other side of our component chain being messed up while handling one
> side. The approach doesn't need any assumption on binding sequence as
> the corresponding bind/unbind callbacks effectively create a state
> machine.

Fine, if you prefer the submaster approach, then ignore my suggestion. As =
long as
you do not use wmi_has_guid(), i am happy.

Thanks,
Armin Wolf

>> If Mark is OK with using the submaster approach then you can ignore the=
 above suggestion.
>>
>> Thanks,
>> Armin Wolf
> Thanks,
> Rong
>
>>> Signed-off-by: Rong Zhang <i@rong.moe>
>>> ---
>>> Changes in v6:
>>> - Fix the error path of component_add(capdata00)
>>> - Elaborate the design in commit message
>>>
>>> Changes in v5:
>>> - Fix missing include (thanks kernel test robot)
>>>
>>> Changes in v4:
>>> - New patch in the series (thanks Armin Wolf's inspiration)
>>>     - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
>>> ---
>>>    drivers/platform/x86/lenovo/wmi-capdata.c | 265 +++++++++++++++++++=
++-
>>>    drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
>>>    drivers/platform/x86/lenovo/wmi-other.c   |   5 -
>>>    3 files changed, 283 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platf=
orm/x86/lenovo/wmi-capdata.c
>>> index e6392357395c..8760f8c071ca 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
>>> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>>> @@ -27,6 +27,7 @@
>>>    #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>   =20
>>>    #include <linux/acpi.h>
>>> +#include <linux/bitfield.h>
>>>    #include <linux/cleanup.h>
>>>    #include <linux/component.h>
>>>    #include <linux/container_of.h>
>>> @@ -50,10 +51,17 @@
>>>    #define ACPI_AC_CLASS "ac_adapter"
>>>    #define ACPI_AC_NOTIFY_STATUS 0x80
>>>   =20
>>> +#define LWMI_FEATURE_ID_FAN_TEST 0x05
>>> +
>>> +#define LWMI_ATTR_ID_FAN_TEST							\
>>> +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
>>> +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
>>> +
>>>    enum lwmi_cd_type {
>>>    	LENOVO_CAPABILITY_DATA_00,
>>>    	LENOVO_CAPABILITY_DATA_01,
>>>    	LENOVO_FAN_TEST_DATA,
>>> +	CD_TYPE_NONE =3D -1,
>>>    };
>>>   =20
>>>    #define LWMI_CD_TABLE_ITEM(_type)		\
>>> @@ -75,6 +83,20 @@ struct lwmi_cd_priv {
>>>    	struct notifier_block acpi_nb; /* ACPI events */
>>>    	struct wmi_device *wdev;
>>>    	struct cd_list *list;
>>> +
>>> +	/*
>>> +	 * A capdata device may be a component master of another capdata dev=
ice.
>>> +	 * E.g., lenovo-wmi-other <-> capdata00 <-> capdata_fan
>>> +	 *       |- master            |- component
>>> +	 *                            |- sub-master
>>> +	 *                                          |- sub-component
>>> +	 */
>>> +	struct lwmi_cd_sub_master_priv {
>>> +		struct device *master_dev;
>>> +		cd_list_cb_t master_cb;
>>> +		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no =
sub-component. */
>>> +		bool registered;                    /* Has the sub-master been regi=
stered? */
>>> +	} *sub_master;
>>>    };
>>>   =20
>>>    struct cd_list {
>>> @@ -125,7 +147,7 @@ void lwmi_cd_match_add_all(struct device *master, =
struct component_match **match
>>>    		return;
>>>   =20
>>>    	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
>>> -		/* Skip optional interfaces. */
>>> +		/* Skip sub-components. */
>>>    		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
>>>    			continue;
>>>   =20
>>> @@ -137,6 +159,56 @@ void lwmi_cd_match_add_all(struct device *master,=
 struct component_match **match
>>>    }
>>>    EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
>>>   =20
>>> +/**
>>> + * lwmi_cd_call_master_cb() - Call the master callback for the sub-co=
mponent.
>>> + * @priv: Pointer to the capability data private data.
>>> + *
>>> + * Call the master callback and pass the sub-component list to it if =
the
>>> + * dependency chain (master <-> sub-master <-> sub-component) is comp=
lete.
>>> + */
>>> +static void lwmi_cd_call_master_cb(struct lwmi_cd_priv *priv)
>>> +{
>>> +	struct cd_list *sub_component_list =3D priv->sub_master->sub_compone=
nt_list;
>>> +
>>> +	/*
>>> +	 * Call the callback only if the dependency chain is ready:
>>> +	 * - Binding between master and sub-master: fills master_dev and mas=
ter_cb
>>> +	 * - Binding between sub-master and sub-component: fills sub_compone=
nt_list
>>> +	 *
>>> +	 * If a binding has been unbound before the other binding is bound, =
the
>>> +	 * corresponding members filled by the former are guaranteed to be c=
leared.
>>> +	 *
>>> +	 * This function is only called in bind callbacks, and the component
>>> +	 * framework guarantees bind/unbind callbacks may never execute
>>> +	 * simultaneously, which implies that it's impossible to have a race
>>> +	 * condition.
>>> +	 *
>>> +	 * Hence, this check is sufficient to ensure that the callback is ca=
lled
>>> +	 * at most once and with the correct state, without relying on a spe=
cific
>>> +	 * sequence of binding establishment.
>>> +	 */
>>> +	if (!sub_component_list ||
>>> +	    !priv->sub_master->master_dev ||
>>> +	    !priv->sub_master->master_cb)
>>> +		return;
>>> +
>>> +	if (PTR_ERR(sub_component_list) =3D=3D -ENODEV)
>>> +		sub_component_list =3D NULL;
>>> +	else if (WARN_ON(IS_ERR(sub_component_list)))
>>> +		return;
>>> +
>>> +	priv->sub_master->master_cb(priv->sub_master->master_dev,
>>> +				    sub_component_list);
>>> +
>>> +	/*
>>> +	 * Prevent "unbind and rebind" sequences from userspace from calling=
 the
>>> +	 * callback twice.
>>> +	 */
>>> +	priv->sub_master->master_cb =3D NULL;
>>> +	priv->sub_master->master_dev =3D NULL;
>>> +	priv->sub_master->sub_component_list =3D NULL;
>>> +}
>>> +
>>>    /**
>>>     * lwmi_cd_component_bind() - Bind component to master device.
>>>     * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
>>> @@ -147,6 +219,8 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOV=
O_WMI_CD");
>>>     * list. This is used to call lwmi_cd*_get_data to look up attribut=
e data
>>>     * from the lenovo-wmi-other driver.
>>>     *
>>> + * If cd_dev is a sub-master, try to call the master callback.
>>> + *
>>>     * Return: 0
>>>     */
>>>    static int lwmi_cd_component_bind(struct device *cd_dev,
>>> @@ -158,6 +232,11 @@ static int lwmi_cd_component_bind(struct device *=
cd_dev,
>>>    	switch (priv->list->type) {
>>>    	case LENOVO_CAPABILITY_DATA_00:
>>>    		binder->cd00_list =3D priv->list;
>>> +
>>> +		priv->sub_master->master_dev =3D om_dev;
>>> +		priv->sub_master->master_cb =3D binder->cd_fan_list_cb;
>>> +		lwmi_cd_call_master_cb(priv);
>>> +
>>>    		break;
>>>    	case LENOVO_CAPABILITY_DATA_01:
>>>    		binder->cd01_list =3D priv->list;
>>> @@ -169,8 +248,167 @@ static int lwmi_cd_component_bind(struct device =
*cd_dev,
>>>    	return 0;
>>>    }
>>>   =20
>>> +/**
>>> + * lwmi_cd_component_unbind() - Unbind component to master device.
>>> + * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
>>> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
>>> + * @data: Unused.
>>> + *
>>> + * If cd_dev is a sub-master, clear the collected data from the maste=
r device to
>>> + * prevent the binding establishment between the sub-master and the s=
ub-
>>> + * component (if it's about to happen) from calling the master callba=
ck.
>>> + */
>>> +static void lwmi_cd_component_unbind(struct device *cd_dev,
>>> +				     struct device *om_dev, void *data)
>>> +{
>>> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
>>> +
>>> +	switch (priv->list->type) {
>>> +	case LENOVO_CAPABILITY_DATA_00:
>>> +		priv->sub_master->master_dev =3D NULL;
>>> +		priv->sub_master->master_cb =3D NULL;
>>> +		return;
>>> +	default:
>>> +		return;
>>> +	}
>>> +}
>>> +
>>>    static const struct component_ops lwmi_cd_component_ops =3D {
>>>    	.bind =3D lwmi_cd_component_bind,
>>> +	.unbind =3D lwmi_cd_component_unbind,
>>> +};
>>> +
>>> +/**
>>> + * lwmi_cd_sub_master_bind() - Bind sub-component of sub-master devic=
e
>>> + * @dev: The sub-master capdata basic device.
>>> + *
>>> + * Call component_bind_all to bind the sub-component device to the su=
b-master
>>> + * device. On success, collect the pointer to the sub-component list =
and try
>>> + * to call the master callback.
>>> + *
>>> + * Return: 0 on success, or an error code.
>>> + */
>>> +static int lwmi_cd_sub_master_bind(struct device *dev)
>>> +{
>>> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(dev);
>>> +	struct cd_list *sub_component_list;
>>> +	int ret;
>>> +
>>> +	ret =3D component_bind_all(dev, &sub_component_list);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	priv->sub_master->sub_component_list =3D sub_component_list;
>>> +	lwmi_cd_call_master_cb(priv);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd_sub_master_unbind() - Unbind sub-component of sub-master d=
evice
>>> + * @dev: The sub-master capdata basic device
>>> + *
>>> + * Clear the collected pointer to the sub-component list to prevent t=
he binding
>>> + * establishment between the sub-master and the sub-component (if it'=
s about to
>>> + * happen) from calling the master callback. Then, call component_unb=
ind_all to
>>> + * unbind the sub-component device from the sub-master device.
>>> + */
>>> +static void lwmi_cd_sub_master_unbind(struct device *dev)
>>> +{
>>> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(dev);
>>> +
>>> +	priv->sub_master->sub_component_list =3D NULL;
>>> +
>>> +	component_unbind_all(dev, NULL);
>>> +}
>>> +
>>> +static const struct component_master_ops lwmi_cd_sub_master_ops =3D {
>>> +	.bind =3D lwmi_cd_sub_master_bind,
>>> +	.unbind =3D lwmi_cd_sub_master_unbind,
>>> +};
>>> +
>>> +/**
>>> + * lwmi_cd_sub_master_add() - Register a sub-master with its sub-comp=
onent
>>> + * @priv: Pointer to the sub-master capdata device private data.
>>> + * @sub_component_type: Type of the sub-component.
>>> + *
>>> + * Match the sub-component type and register the current capdata devi=
ce as a
>>> + * sub-master. If the given sub-component type is CD_TYPE_NONE, mark =
the sub-
>>> + * component as non-existent without registering sub-master.
>>> + *
>>> + * Return: 0 on success, or an error code.
>>> + */
>>> +static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
>>> +				  enum lwmi_cd_type sub_component_type)
>>> +{
>>> +	struct component_match *master_match =3D NULL;
>>> +	int ret;
>>> +
>>> +	priv->sub_master =3D devm_kzalloc(&priv->wdev->dev, sizeof(*priv->su=
b_master), GFP_KERNEL);
>>> +	if (!priv->sub_master)
>>> +		return -ENOMEM;
>>> +
>>> +	if (sub_component_type =3D=3D CD_TYPE_NONE) {
>>> +		/* The master callback will be called with NULL on bind. */
>>> +		priv->sub_master->sub_component_list =3D ERR_PTR(-ENODEV);
>>> +		priv->sub_master->registered =3D false;
>>> +		return 0;
>>> +	}
>>> +
>>> +	/*
>>> +	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stac=
k
>>> +	 * data cannot be used here. Steal one from lwmi_cd_table.
>>> +	 */
>>> +	component_match_add(&priv->wdev->dev, &master_match, lwmi_cd_match,
>>> +			    (void *)&lwmi_cd_table[sub_component_type].type);
>>> +	if (IS_ERR(master_match))
>>> +		return PTR_ERR(master_match);
>>> +
>>> +	ret =3D component_master_add_with_match(&priv->wdev->dev, &lwmi_cd_s=
ub_master_ops,
>>> +					      master_match);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	priv->sub_master->registered =3D true;
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd_sub_master_del() - Unregister a sub-master if it's registe=
red
>>> + * @priv: Pointer to the sub-master capdata device private data.
>>> + */
>>> +static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
>>> +{
>>> +	if (priv->sub_master->registered) {
>>> +		component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
>>> +		priv->sub_master->registered =3D false;
>>> +	}
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd_sub_component_bind() - Bind sub-component to sub-master de=
vice.
>>> + * @sc_dev: Pointer to the sub-component capdata parent device.
>>> + * @sm_dev: Pointer to the sub-master capdata parent device.
>>> + * @data: Pointer used to return the capability data list pointer.
>>> + *
>>> + * On sub-master's bind, provide a pointer to the local capdata list.
>>> + * This is used by the sub-master to call the master callback.
>>> + *
>>> + * Return: 0
>>> + */
>>> +static int lwmi_cd_sub_component_bind(struct device *sc_dev,
>>> +				      struct device *sm_dev, void *data)
>>> +{
>>> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(sc_dev);
>>> +	struct cd_list **listp =3D data;
>>> +
>>> +	*listp =3D priv->list;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct component_ops lwmi_cd_sub_component_ops =3D {
>>> +	.bind =3D lwmi_cd_sub_component_bind,
>>>    };
>>>   =20
>>>    /**
>>> @@ -470,9 +708,28 @@ static int lwmi_cd_probe(struct wmi_device *wdev,=
 const void *context)
>>>    		goto out;
>>>   =20
>>>    	switch (info->type) {
>>> -	case LENOVO_CAPABILITY_DATA_00:
>>> +	case LENOVO_CAPABILITY_DATA_00: {
>>> +		enum lwmi_cd_type sub_component_type =3D LENOVO_FAN_TEST_DATA;
>>> +		struct capdata00 capdata00;
>>> +
>>> +		ret =3D lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capd=
ata00);
>>> +		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
>>> +			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
>>> +			sub_component_type =3D CD_TYPE_NONE;
>>> +		}
>>> +
>>> +		/* Sub-master (capdata00) <-> sub-component (capdata_fan) */
>>> +		ret =3D lwmi_cd_sub_master_add(priv, sub_component_type);
>>> +		if (ret)
>>> +			goto out;
>>> +
>>> +		/* Master (lenovo-wmi-other) <-> sub-master (capdata00) */
>>>    		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>>> +		if (ret)
>>> +			lwmi_cd_sub_master_del(priv);
>>> +
>>>    		goto out;
>>> +	}
>>>    	case LENOVO_CAPABILITY_DATA_01:
>>>    		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>>>   =20
>>> @@ -488,6 +745,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, =
const void *context)
>>>    		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>>>    		goto out;
>>>    	case LENOVO_FAN_TEST_DATA:
>>> +		ret =3D component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
>>>    		goto out;
>>>    	default:
>>>    		return -EINVAL;
>>> @@ -509,10 +767,13 @@ static void lwmi_cd_remove(struct wmi_device *wd=
ev)
>>>   =20
>>>    	switch (priv->list->type) {
>>>    	case LENOVO_CAPABILITY_DATA_00:
>>> +		lwmi_cd_sub_master_del(priv);
>>> +		fallthrough;
>>>    	case LENOVO_CAPABILITY_DATA_01:
>>>    		component_del(&wdev->dev, &lwmi_cd_component_ops);
>>>    		break;
>>>    	case LENOVO_FAN_TEST_DATA:
>>> +		component_del(&wdev->dev, &lwmi_cd_sub_component_ops);
>>>    		break;
>>>    	default:
>>>    		WARN_ON(1);
>>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platf=
orm/x86/lenovo/wmi-capdata.h
>>> index 38af4c4e4ef4..59ca3b3e5760 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
>>> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
>>> @@ -5,8 +5,20 @@
>>>    #ifndef _LENOVO_WMI_CAPDATA_H_
>>>    #define _LENOVO_WMI_CAPDATA_H_
>>>   =20
>>> +#include <linux/bits.h>
>>>    #include <linux/types.h>
>>>   =20
>>> +#define LWMI_SUPP_VALID		BIT(0)
>>> +#define LWMI_SUPP_MAY_GET	(LWMI_SUPP_VALID | BIT(1))
>>> +#define LWMI_SUPP_MAY_SET	(LWMI_SUPP_VALID | BIT(2))
>>> +
>>> +#define LWMI_ATTR_DEV_ID_MASK	GENMASK(31, 24)
>>> +#define LWMI_ATTR_FEAT_ID_MASK	GENMASK(23, 16)
>>> +#define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
>>> +#define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
>>> +
>>> +#define LWMI_DEVICE_ID_FAN	0x04
>>> +
>>>    struct component_match;
>>>    struct device;
>>>    struct cd_list;
>>> @@ -32,9 +44,17 @@ struct capdata_fan {
>>>    	u32 max_rpm;
>>>    };
>>>   =20
>>> +typedef void (*cd_list_cb_t)(struct device *master_dev, struct cd_lis=
t *cd_list);
>>> +
>>>    struct lwmi_cd_binder {
>>>    	struct cd_list *cd00_list;
>>>    	struct cd_list *cd01_list;
>>> +	/*
>>> +	 * May be called during or after the bind callback.
>>> +	 * Will be called with NULL if capdata_fan does not exist.
>>> +	 * The pointer is only valid in the callback; never keep it for late=
r use!
>>> +	 */
>>> +	cd_list_cb_t cd_fan_list_cb;
>>>    };
>>>   =20
>>>    void lwmi_cd_match_add_all(struct device *master, struct component_=
match **matchptr);
>>> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfor=
m/x86/lenovo/wmi-other.c
>>> index f2e1e34d58a9..b3adcc2804fa 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-other.c
>>> +++ b/drivers/platform/x86/lenovo/wmi-other.c
>>> @@ -54,11 +54,6 @@
>>>    #define LWMI_FEATURE_VALUE_GET 17
>>>    #define LWMI_FEATURE_VALUE_SET 18
>>>   =20
>>> -#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
>>> -#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
>>> -#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
>>> -#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
>>> -
>>>    #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>>>   =20
>>>    static BLOCKING_NOTIFIER_HEAD(om_chain_head);
