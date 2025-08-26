Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A10B31A577;
	Tue, 26 Aug 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233822; cv=none; b=Vb1CPlpOtevJF5taAdM/S2sIrU+VhwVqdCovwt0WEWtwbnNw4vAYu4CCQYpHBg8j7+yO7edX4To6EY7+y+Zu2LjRZj26V8yDhUUF5IppYHzpyKyCNHaWOLfam9yV/QU+mN7GhOQY1dX3aQ+XHRzGN2sUHLPLNERUykAgzHkMIZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233822; c=relaxed/simple;
	bh=qqMP+yLDGB1vt8AMEhU+Uk4amKpA4giXrUNi3KsGGMw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B96YcHzk68iYLuZf0IqeNApHg7wehp2N4RLrgl7fXszRsjxz32TNinhjBl7LEVE3ZSOy6PvnsUQtoEUStAn09QcFzdEu0wKeuash6f51rR+Te20ZNEdeK3145nBO6CAYBEab9+GHMTavC66AgAMDIy/a8T6xMB6fHZpJ13PtUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=BdCCf62V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aHB8GSWX; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="BdCCf62V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aHB8GSWX"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 45AAC7A0158;
	Tue, 26 Aug 2025 14:43:38 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Tue, 26 Aug 2025 14:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756233818;
	 x=1756320218; bh=+ZHM48sHy6BH1KbNq5pOM5FQr8Uolurz9cVjGfFa6+8=; b=
	BdCCf62V4LkS1aWHlfsP4kvYyr/cb0DOtjCyvbrJvnr3zR2SnXxsLnDIpSBUQZ+/
	9pxgJnJAzT9gAq/zKGqK95XFdecpeC2kOo2keGs7likVknKh6D6kUPLdCBqWPUIz
	B16hBR7UmDol3m3C7O4WtAvjNdqNLlzEopjOjS8GDVvQXGyBoguiuoMZuAtXnyaK
	0Q8guMqr2rVKwAthv5IToIK4Mf24fH6gE4XG0xjxVRC3xQ0l/YafyHgtGGHiDpYB
	fSruY438Q90jWHEjH45ovCtcYRVu2bE1BwmC5FuCFMvFMI62GdcBLaJBaBMydD91
	SGT8CVBkHsarkMbYTrBTpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756233818; x=
	1756320218; bh=+ZHM48sHy6BH1KbNq5pOM5FQr8Uolurz9cVjGfFa6+8=; b=a
	HB8GSWXM2lyl7DgyTzTChjxnknoh6SiKHTd40ynrBzF4y5Txb0SGHG8j3IiQ/opc
	YYyL2ad6jn44DJDuhLVUPvN1Fj2oVuieWNmPYo97VU98RGpF64KgGyqIurSc7C5t
	xhyVxIKeERc0YcfXY1LZw461N+DjBB/8SEByrTLyfBDM3vkri5xljA2LN0l75R4w
	/+beZP2oGO6FNNABwYkIFsKn5gKRoY9kHCzcK+jYo5CsNZujx6qVWZyyIY8uCGcF
	to2bEguNouinjNvDUFyb0Ip1EYRUovzKw2z6siOSHcEH+CVaAjtXrMqUeof0yZJo
	djSnEPW3qpW8TybV7hLeQ==
X-ME-Sender: <xms:WACuaNLzsnpTkl9G7nsbsEC2OrfYqoXtTGcMMblNVxf86YbtgpBz8w>
    <xme:WACuaJKYzi6SFcKilIOKlg5rzqPc3940PIlXy1Uialj1ZBL9XM8JGfZolZuXCIyJ8
    O5v99T4xRRZq9k6sw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeeitdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeegvdegueffhfdtleeigfejhffggfeivdejgeelueej
    uedtudetheejudehtdeitdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepledpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghi
    lhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhope
    hhmhhhsehhmhhhrdgvnhhgrdgsrhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvg
    hlrdgtohhmpdhrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhs
    ohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtohepmhgrrhgtrdgsuhhrkhhhrghrug
    htsehprhhothhotghordgtohhnshhulhhtihhnghdprhgtphhtthhopehlihhnuhigqdhh
    fihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WACuaAyZUDWXuMiL-oXDg5hO2wRQvSYslAFroYuh0tg8Vo0nU5nPVw>
    <xmx:WACuaBpboi87eTTzqyHgNwT2XiuSkqsb8WJt9DcLzG62akDE8uqAzw>
    <xmx:WACuaL02ZHDB-ZrYGaFcg54dY3N-J3DvVpx7E4JGjgkNRsAGjemF9A>
    <xmx:WACuaJzej8mf1Q-4-TcQcWbRhYZfoP-6OkvsU6hyfsD72c1p4Ryxdw>
    <xmx:WgCuaFlczN2jt_V-P3Av2niZHbEjvDQ0XPfApb92LIPvymZBhFKFGyZ3>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A2CD02CE007E; Tue, 26 Aug 2025 14:43:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AqlvLU1YwUxg
Date: Tue, 26 Aug 2025 14:43:09 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>,
 "Marc Burkhardt" <marc.burkhardt@protoco.consulting>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Message-Id: <38204315-49e8-4428-bb8b-81e8f520130d@app.fastmail.com>
In-Reply-To: <b4640a0d-c5db-4d40-a336-97fb16e8d405@gmx.de>
References: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
 <196b8004-3b09-48d4-891a-80eee2efbf3c@app.fastmail.com>
 <ebaa2ff317a21291a086a55b204d2d68@protoco.consulting>
 <b4640a0d-c5db-4d40-a336-97fb16e8d405@gmx.de>
Subject: Re: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to suppress
 invalid thermal sensors
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 22, 2025, at 7:54 AM, Armin Wolf wrote:
> Am 21.08.25 um 19:32 schrieb Marc Burkhardt:
>
>> Am 2025-08-20 00:03, schrieb Mark Pearson:
>>
>> Hi Mark,
>>
>> thanks for replying.
>>
>>> Hi Marc,
>>>
>>> On Mon, Aug 18, 2025, at 4:39 PM, Marc Burkhardt wrote:
>>>> While moving an existing Icinga installation to a Lenovo P15 20SU I=20
>>>> came
>>>> across broken JSON output from a "sensors -Aj" command consumed by =
the
>>>> Icinga check_lm_sensors plugin. After fiddling around trying to bui=
ld a
>>>> fix in either lm_sensors or Icinga I found out the error was rooted=
 in
>>>> some sysfs file that was created but threw errors while being read.=20
>>>> On my
>>>> Lenovo ThinkPad the default fallback to 8 temperature sensors creat=
es
>>>> sysfs entries like in my case "temp8_input" that fail when read,=20
>>>> causing
>>>> the issue in user-space.
>>>>
>>>> This patch adds a module parameter (suppress_sensor) using
>>>> module_param_array() to allow users to specify a comma-separated=20
>>>> list of
>>>> zero-based sensor indices to suppress sysfs file creation (e.g.
>>>> suppress_sensor=3D3,7). Instead of a model-specific quirk, this pro=
vides
>>>> flexible configuration for any ThinkPad with similar issues and is=20
>>>> working
>>>> out-of-the-box without additional models being marked for the quirk=
.=20
>>>> The
>>>> parameter uses a fixed-size array based on=20
>>>> TPACPI_MAX_THERMAL_SENSORS (16)
>>>> consistent with the driver=E2=80=99s thermal sensor handling (ie.
>>>> ibm_thermal_sensors_struct or sensor_dev_attr_thermal_temp_input).
>>>>
>>>> Logging via pr_info() reports the number of suppressed sensors at=20
>>>> module
>>>> initialization, and pr_info() logs each suppressed sensor during sy=
sfs
>>>> attribute creation. Invalid sensor indices are logged once via=20
>>>> pr_warn()
>>>> to avoid repetitive warnings. Tested on a ThinkPad P15 with
>>>> suppress_sensor=3D3,7, confirming suppression of temp4_input and=20
>>>> temp8_input
>>>> with no sysfs errors. Bounds checking for uncommon values is in=20
>>>> place or
>>>> will be logged.
>>>>
>>>> The patch applies to the current
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=20
>>>> although
>>>> it was initially written for a 6.16.0 kernel.
>>>>
>>>> I look forward to any feedback on the patch and/or handling of=20
>>>> submission.
>>>> Please CC: for now as I am not (yet) subscribed. Thank you.
>>>>
>>>> Signed-off-by: Marc Burkhardt <marc.burkhardt@protoco.consulting>
>>>> ---
>>>> Notes:
>>>> I haven't posted on LKML or send a patch for over a decade now so
>>>> please forgive any possible mistakes I made regarding current coding
>>>> conventions or more generally in submitting this patch. The patch w=
as
>>>> running for some time here with faulty sensors removed from sysfs=20
>>>> and no
>>>> problems otherwise detected and was surely run through checkpatch.p=
l=20
>>>> before
>>>> submission. get_maintainer.pl was helpful to find the hopefully rig=
ht
>>>> people for CC:ing but I am otherweise totally unaware of any current
>>>> procedures or best-practices when it comes to submitting a patch.
>>>>
>>>> drivers/platform/x86/lenovo/thinkpad_acpi.c | 35=20
>>>> +++++++++++++++++++++++++++++
>>>> =C2=A01 file changed, 35 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> index cc19fe520ea9..30ff01f87403 100644
>>>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> @@ -6019,6 +6019,30 @@ struct ibm_thermal_sensors_struct {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 s32 temp[TPACPI_MAX_THERMAL_SENSORS];
>>>> =C2=A0};
>>>>
>>>> +static int suppress_sensor[TPACPI_MAX_THERMAL_SENSORS];
>>>> +static unsigned int suppress_sensor_count;
>>>> +
>>>> +static bool is_sensor_suppressed(int index)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>> +=C2=A0=C2=A0=C2=A0 bool logged =3D false;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < suppress_sensor_count; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (suppress_sensor[i] =
=3D=3D index)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return true;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!logged &&
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (suppress_sensor[i] < 0
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 || suppress_sensor[i] >=3D=20
>>>> TPACPI_MAX_THERMAL_SENSORS)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_warn("Invalid sensor index %d in suppress_sensor\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 suppress_sensor[i]);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 logged =3D true;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return false;
>>>> +}
>>>> +
>>>> =C2=A0static const struct tpacpi_quirk thermal_quirk_table[] __init=
const =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* Non-standard address for thermal regist=
ers on some ThinkPads */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 TPACPI_Q_LNV3('R', '1', 'F', true),=C2=A0=C2=
=A0=C2=A0 /* L13 Yoga Gen 2 */
>>>> @@ -6313,6 +6337,11 @@ static umode_t thermal_attr_is_visible(struct
>>>> kobject *kobj,
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int idx =3D sensor_attr->index;
>>>>
>>>> +=C2=A0=C2=A0=C2=A0 if (is_sensor_suppressed(idx)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info("Sensor %d supp=
ressed\n", idx);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 switch (thermal_read_mode) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 case TPACPI_THERMAL_NONE:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> @@ -11653,6 +11682,9 @@ static void __init
>>>> thinkpad_acpi_init_banner(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 thinkpad_id.model_str,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (thinkpad_id.nummodel_str) ?
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 thinkpad_id.nummodel_str : "unknown");
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 pr_info("Suppressing %d user-supplied sensor(s)=
 via parameter
>>>> suppress_sensor\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suppress_sensor_count);
>>>> =C2=A0}
>>>>
>>>> =C2=A0/* Module init, exit, parameters */
>>>> @@ -11785,6 +11817,9 @@ MODULE_PARM_DESC(experimental,
>>>> =C2=A0module_param_named(debug, dbg_level, uint, 0);
>>>> =C2=A0MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
>>>>
>>>> +module_param_array(suppress_sensor, int, &suppress_sensor_count,=20
>>>> 0444);
>>>> +MODULE_PARM_DESC(suppress_sensor, "Comma-separated sensor indices =
to
>>>> suppress (e.g., 3,7)");
>>>> +
>>>> =C2=A0module_param(force_load, bool, 0444);
>>>> =C2=A0MODULE_PARM_DESC(force_load,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Attempts to=
 load the driver even on a mis-identified=20
>>>> ThinkPad when
>>>> true");
>>>
>>> The P15 is one of the Linux certified platforms...though it's a bit=20
>>> older now.
>>>
>>> I'd be more interested in figuring out which sensors are returning a=
n=20
>>> error and figuring out how we address that. I have access to the FW=20
>>> and platform team for questions (though this platform is a bit older=20
>>> now, so if we need FW fixes that will be trickier). My gut feeling i=
s=20
>>> we shouldn't be creating sysfs entries if the sensors don't exist or=20
>>> aren't accessible.
>>
>> That is what my patch does - it prevents creating the sysfs entries=20
>> but not based on a check for validity of the sensor in code (as=20
>> probably desired by Ilpo when I understand a previous mail correctly)=20
>> but rather on a user-provided configuration via the new parameter. I=20
>> reply to the other mail as well soon.
>>
> Such sensors are meant to be ignored using /etc/sensors3.conf (provide=
d=20
> by libsensors) unless the driver itself can
> automatically determine this by asking the platform firmware. I sugges=
t=20
> that you use this mechanism instead of adding
> additional module parameters.
>
> Thanks,
> Armin Wolf
>
> (I also CCed the hwmon mailing list as libsensors originally came from=
 there)
>
>>>
>>> I do have a P15 so can check it out (I'm going to have to blow some=20
>>> dust off it). If you've got the details on which sensors need=20
>>> suppressing that would be useful. I have seen previously where it's=20
>>> trying to access a GPU sensor on a UMA model.
>>
>> On my hardware it's sensor temp8_input which is unreadable at all und=20
>> sensor temp4_input that has a constant value of 0, no matter how hot,=20
>> cold or loud the machine is running. I am, however, able to monitor=20
>> GPU temps via nvidia _and_ thinkpad ACPI. The values are mostly equal=
,=20
>> differ a bit due to internal timing sometimes.
>>
>>>

I tried this on my P15, and I do get an error when the GPU sensor is acc=
essed as it's not available (no Nvidia card on mine).

A suggestion (based a bit on Armin's suggestions): If the is_visible fun=
ction is changed so if the sensor returns an error (or not available) th=
en the sysfs entry isn't displayed.=20
I think that would prevent errors/access issues from user space - at lea=
st it worked on my system.

Something like the below (I can send this up as a proper patch if it mak=
es sense)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platf=
orm/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..075d15df183c 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -6312,6 +6312,8 @@ static umode_t thermal_attr_is_visible(struct kobj=
ect *kobj,
                                        to_sensor_dev_attr(dev_attr);
=20
        int idx =3D sensor_attr->index;
+       s32 value;
+       int res;
=20
        switch (thermal_read_mode) {
        case TPACPI_THERMAL_NONE:
@@ -6334,6 +6336,11 @@ static umode_t thermal_attr_is_visible(struct kob=
ject *kobj,
=20
        }
=20
+       /* Check if sensor is available */
+       res =3D thermal_get_sensor(idx, &value);
+       if ((res) || (value =3D=3D TPACPI_THERMAL_SENSOR_NA))
+               return 0;
+
        return attr->mode;
 }

I think this would generally be useful for removing unwanted sensors wit=
hout having to do extra steps?

Mark
