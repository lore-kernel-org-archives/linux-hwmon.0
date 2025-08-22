Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1417B402;
	Fri, 22 Aug 2025 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863724; cv=none; b=N81ddsTI5EUC6UD8UIbXuB0dgrzTcK0ntR85mN0ptmEyuCv7LofHx5GUBIOdSGz9csMZDdxEle1Gu3ide3ggGVS1afulYlMp10xLbqCIw50HB6S+D/4TDusS8pvcF/X/S4/7fKgHZBXWeM6hx55siGbGCX7sylqxT+0YTDZvrp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863724; c=relaxed/simple;
	bh=Lu9IRRvPM24U7OFYy8PR7CG7XhX/qIcxBeZg8JkqQH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVLxNv7mO14hNbWMgqIqsND7nNxkdooGJ+hRjAFPlvcAGt49WbstNKeJeLOk0BF29CHhwPZwCBfjZbfvFNGVf1XEu/9edVjZ2aeIlfu5TiZIp8p2Sex8ouXr4TiN1ZmGEHZgQx/gkq5IYbjD+mljCVI+AusaLvmBdKqBEgb2OJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UA/qEPHK; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UA/qEPHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1755863696; x=1756468496; i=w_armin@gmx.de;
	bh=Lu9IRRvPM24U7OFYy8PR7CG7XhX/qIcxBeZg8JkqQH0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UA/qEPHKG4Vzbc1MymL1koPj+bQe96shtxd6i3V8zkbTp/CzaqF/MjkpI/f5LDFw
	 71yhL4SaqU0bZvHeI5xf9wN9e629QHjrCP+CwaOmWSY2eYef5izmymDZB0/Q1F5WC
	 IAXQSPt17NV3ISLNt+wey4GB9pC6i9mR4Tost9tQMjbc3BXtSlZcQpoYdy4fXeXU/
	 XvDq9ILtzSk5q5rtJyxLFxTFzLcgik7lDb+jFDls8wqQ20EVvPpfKZzq+mUPzOzP1
	 +h6ktwsytk46TAtFTq2wKGWsoowWM2kqcms/pXm1rdhpQ2SM/7g+PRcWJMGDmlAiw
	 1Y5XjHE3qtgLx54rgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.189.91.1] ([176.5.63.45]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeI2-1uzIHD2ne0-00RPlj; Fri, 22
 Aug 2025 13:54:56 +0200
Message-ID: <b4640a0d-c5db-4d40-a336-97fb16e8d405@gmx.de>
Date: Fri, 22 Aug 2025 13:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to
 suppress invalid thermal sensors
To: marc.burkhardt@protoco.consulting,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
 <196b8004-3b09-48d4-891a-80eee2efbf3c@app.fastmail.com>
 <ebaa2ff317a21291a086a55b204d2d68@protoco.consulting>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ebaa2ff317a21291a086a55b204d2d68@protoco.consulting>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pwwky3v9kRlTPArBzPmURB7S+ktX2rkdJ21nf5Gbm/pHP0WXnRf
 nng40nK2vXbCEzfw1oD27sJ53ot3Y2JOYTO/Erwu8mU0MaAOul4pJeTm5SpsiQdaShS6u4Z
 9+BFay6+Lw8IPShrv8KV2skzRPhoVj3wTnL/tul4nekGFJDKV4PcV6bBrdo2gQBJOjsCRvy
 7cQPd8W/OIkmpB4bz43bA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w5P4ET1Ty8E=;Kf6rs4pFpKKPsdRFfryeUxtYtJB
 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

Am 21.08.25 um 19:32 schrieb Marc Burkhardt:

> Am 2025-08-20 00:03, schrieb Mark Pearson:
>
> Hi Mark,
>
> thanks for replying.
>
>> Hi Marc,
>>
>> On Mon, Aug 18, 2025, at 4:39 PM, Marc Burkhardt wrote:
>>> While moving an existing Icinga installation to a Lenovo P15 20SU I=20
>>> came
>>> across broken JSON output from a "sensors -Aj" command consumed by the
>>> Icinga check_lm_sensors plugin. After fiddling around trying to build =
a
>>> fix in either lm_sensors or Icinga I found out the error was rooted in
>>> some sysfs file that was created but threw errors while being read.=20
>>> On my
>>> Lenovo ThinkPad the default fallback to 8 temperature sensors creates
>>> sysfs entries like in my case "temp8_input" that fail when read,=20
>>> causing
>>> the issue in user-space.
>>>
>>> This patch adds a module parameter (suppress_sensor) using
>>> module_param_array() to allow users to specify a comma-separated=20
>>> list of
>>> zero-based sensor indices to suppress sysfs file creation (e.g.
>>> suppress_sensor=3D3,7). Instead of a model-specific quirk, this provid=
es
>>> flexible configuration for any ThinkPad with similar issues and is=20
>>> working
>>> out-of-the-box without additional models being marked for the quirk.=
=20
>>> The
>>> parameter uses a fixed-size array based on=20
>>> TPACPI_MAX_THERMAL_SENSORS (16)
>>> consistent with the driver=E2=80=99s thermal sensor handling (ie.
>>> ibm_thermal_sensors_struct or sensor_dev_attr_thermal_temp_input).
>>>
>>> Logging via pr_info() reports the number of suppressed sensors at=20
>>> module
>>> initialization, and pr_info() logs each suppressed sensor during sysfs
>>> attribute creation. Invalid sensor indices are logged once via=20
>>> pr_warn()
>>> to avoid repetitive warnings. Tested on a ThinkPad P15 with
>>> suppress_sensor=3D3,7, confirming suppression of temp4_input and=20
>>> temp8_input
>>> with no sysfs errors. Bounds checking for uncommon values is in=20
>>> place or
>>> will be logged.
>>>
>>> The patch applies to the current
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=20
>>> although
>>> it was initially written for a 6.16.0 kernel.
>>>
>>> I look forward to any feedback on the patch and/or handling of=20
>>> submission.
>>> Please CC: for now as I am not (yet) subscribed. Thank you.
>>>
>>> Signed-off-by: Marc Burkhardt <marc.burkhardt@protoco.consulting>
>>> ---
>>> Notes:
>>> I haven't posted on LKML or send a patch for over a decade now so
>>> please forgive any possible mistakes I made regarding current coding
>>> conventions or more generally in submitting this patch. The patch was
>>> running for some time here with faulty sensors removed from sysfs=20
>>> and no
>>> problems otherwise detected and was surely run through checkpatch.pl=
=20
>>> before
>>> submission. get_maintainer.pl was helpful to find the hopefully right
>>> people for CC:ing but I am otherweise totally unaware of any current
>>> procedures or best-practices when it comes to submitting a patch.
>>>
>>> drivers/platform/x86/lenovo/thinkpad_acpi.c | 35=20
>>> +++++++++++++++++++++++++++++
>>> =C2=A01 file changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>> index cc19fe520ea9..30ff01f87403 100644
>>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>> @@ -6019,6 +6019,30 @@ struct ibm_thermal_sensors_struct {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 s32 temp[TPACPI_MAX_THERMAL_SENSORS];
>>> =C2=A0};
>>>
>>> +static int suppress_sensor[TPACPI_MAX_THERMAL_SENSORS];
>>> +static unsigned int suppress_sensor_count;
>>> +
>>> +static bool is_sensor_suppressed(int index)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>> +=C2=A0=C2=A0=C2=A0 bool logged =3D false;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < suppress_sensor_count; i++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (suppress_sensor[i] =3D=
=3D index)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!logged &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (s=
uppress_sensor[i] < 0
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 || suppress_sensor[i] >=3D=20
>>> TPACPI_MAX_THERMAL_SENSORS)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_warn("Invalid sensor index %d in suppress_sensor\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 suppress_sensor[i]);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lo=
gged =3D true;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return false;
>>> +}
>>> +
>>> =C2=A0static const struct tpacpi_quirk thermal_quirk_table[] __initcon=
st =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* Non-standard address for thermal registers=
 on some ThinkPads */
>>> =C2=A0=C2=A0=C2=A0=C2=A0 TPACPI_Q_LNV3('R', '1', 'F', true),=C2=A0=C2=
=A0=C2=A0 /* L13 Yoga Gen 2 */
>>> @@ -6313,6 +6337,11 @@ static umode_t thermal_attr_is_visible(struct
>>> kobject *kobj,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 int idx =3D sensor_attr->index;
>>>
>>> +=C2=A0=C2=A0=C2=A0 if (is_sensor_suppressed(idx)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info("Sensor %d suppres=
sed\n", idx);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0 switch (thermal_read_mode) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 case TPACPI_THERMAL_NONE:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> @@ -11653,6 +11682,9 @@ static void __init
>>> thinkpad_acpi_init_banner(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 thinkpad_id.model_str,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (thinkpad_id.nummodel_str) ?
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 thinkpad_id.nummodel_str : "unknown");
>>> +
>>> +=C2=A0=C2=A0=C2=A0 pr_info("Suppressing %d user-supplied sensor(s) vi=
a parameter
>>> suppress_sensor\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suppress_sensor_count);
>>> =C2=A0}
>>>
>>> =C2=A0/* Module init, exit, parameters */
>>> @@ -11785,6 +11817,9 @@ MODULE_PARM_DESC(experimental,
>>> =C2=A0module_param_named(debug, dbg_level, uint, 0);
>>> =C2=A0MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
>>>
>>> +module_param_array(suppress_sensor, int, &suppress_sensor_count,=20
>>> 0444);
>>> +MODULE_PARM_DESC(suppress_sensor, "Comma-separated sensor indices to
>>> suppress (e.g., 3,7)");
>>> +
>>> =C2=A0module_param(force_load, bool, 0444);
>>> =C2=A0MODULE_PARM_DESC(force_load,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Attempts to lo=
ad the driver even on a mis-identified=20
>>> ThinkPad when
>>> true");
>>
>> The P15 is one of the Linux certified platforms...though it's a bit=20
>> older now.
>>
>> I'd be more interested in figuring out which sensors are returning an=
=20
>> error and figuring out how we address that. I have access to the FW=20
>> and platform team for questions (though this platform is a bit older=20
>> now, so if we need FW fixes that will be trickier). My gut feeling is=
=20
>> we shouldn't be creating sysfs entries if the sensors don't exist or=20
>> aren't accessible.
>
> That is what my patch does - it prevents creating the sysfs entries=20
> but not based on a check for validity of the sensor in code (as=20
> probably desired by Ilpo when I understand a previous mail correctly)=20
> but rather on a user-provided configuration via the new parameter. I=20
> reply to the other mail as well soon.
>
Such sensors are meant to be ignored using /etc/sensors3.conf (provided by=
 libsensors) unless the driver itself can
automatically determine this by asking the platform firmware. I suggest th=
at you use this mechanism instead of adding
additional module parameters.

Thanks,
Armin Wolf

(I also CCed the hwmon mailing list as libsensors originally came from the=
re)

>>
>> I do have a P15 so can check it out (I'm going to have to blow some=20
>> dust off it). If you've got the details on which sensors need=20
>> suppressing that would be useful. I have seen previously where it's=20
>> trying to access a GPU sensor on a UMA model.
>
> On my hardware it's sensor temp8_input which is unreadable at all und=20
> sensor temp4_input that has a constant value of 0, no matter how hot,=20
> cold or loud the machine is running. I am, however, able to monitor=20
> GPU temps via nvidia _and_ thinkpad ACPI. The values are mostly equal,=
=20
> differ a bit due to internal timing sometimes.
>
>>
>> Mark
>
> Marc
>
