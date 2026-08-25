Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825363CB560
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686471; cv=pass; b=nzjNVGZjPr8POIlNFI8/CvzWzUhMaJL4Rnl7Iorwra1IKj3jXRXrZ+bnkzX0Jdq+pP9RMlYuEhuNleeIuc86FecJHF8NRanfy4mgk8RtQZxMOsiRT/pl4f+lNMdLcE/2yl6N0BTapGsoAyncIYGDenL7jAWP/1D3YTvFnaDpHm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686471; c=relaxed/simple;
	bh=RS0I93O5o2Z5xNwIbiaDzLzR0FEOnFsUcaC4g3UmvtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKf3bEjCarUAuJi6fyPjXEJTw2gON9M+ZFJA7UpS8rzrDctqH0yovCS3wbJfzdtpNNsNIKg7ykFaqtvgVAArm8PX2pG763iFbGwFlaw7c4yph9YopMUQbTerIwsLi7Qhzn5nJ6nZEMqdOBi1fJrD5grnLnjwygGMuJhOf5Q7uds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqnR+Pnz; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqnR+Pnz"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so1228306d6.2
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 12:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787686467; cv=none;
        d=google.com; s=arc-20260327;
        b=SThqcYzWj0PN5DrBVcT6jU8RPchW8lhNt0znkPiW4/2lUGcCQdnlMTM9kyugSlhv1h
         vq+sUXGGNU3lXllDzOtXM6NEQQgh3l20lVxVB53V5SW6gGoZfk2S6dBNxRxfWCK9CMfh
         GsJJHPTsy/lw4NjoxWQoknLmUlGrA5yQooLpPKMoSapHX0CFy8t8qUfMUrn+sMWnqMtx
         RqDBPvoSYerS1P7+BIB2BwgcexfgpczTyP7pgWu9ih1wsHZ3G+1GzmBkrQKWEbk1tzqp
         3n/sPBfHGcmiMyIdzceTxG3j4imkWr+gs0VklonyvdLDV1s5y8Viz4ySOAVG2gB12puz
         vgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aMrfhsBi6zPSDyFzFiYlc0JlOzKBdsUewsQmdVbuEb4=;
        fh=Q0CiJjSX9qQmHlPLIssoa6gE9gfIM3yEZpsdvmI8ks0=;
        b=B6iCjGmUmcic+ZR/f/w/r5qKucnWn/QcvQe6ksZysza7RnBYIv3pGC4LJzNHimXKFq
         LMz8dCJDp4deB5bHkIHTS12YkiWMJBPbYDxqcNgkBhgru/mO2kVDMk5mJWge+cVQOWaJ
         oS1MgSTZMPK4L9f6z3dDu++WKIo60c4Jn5zGldW9rCeBds7Gf30gn2n0wKdfFIYvM0lR
         drK8Im0VrkGnktNU3ExBUEkzEWeXIjkgaYefWi89pAZRLPH4WF3X18Ha+/q7X+lLW4e/
         E1idem2VIlDHUR+tqrLN9tPNM1aw2eUmmIpGXUzTlo0orLCZEQ1O0+hg00X4b3OE2FRW
         bDJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787686467; x=1788291267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMrfhsBi6zPSDyFzFiYlc0JlOzKBdsUewsQmdVbuEb4=;
        b=OqnR+PnzIqkm4FqVdG/aeubldyEK/2S6HubkykFVRNIaiYkoHspUkpTCHeC6vrOkaP
         qXG6TL8oVqufTymEoUyIUdYYU2F7XgEeIPoHKNme+m/hXDbzCLHg3zhaFUV+0sf5Ne9j
         asE/RlE/dGlyxsRu5RKfD7Kjq/YaJhlKCq7CNBWfP7PucaENwfTnHLKaSvfXRfAiAiee
         2j1P53wh8097viM9r1ne29fPdsYlLLyBNqwODFikD3vc2bj3R9PgieVlSitHxqrHTPvI
         1Zgl7IZZYOcdnEDNQfV4FFq1lPHwlm/rszY6um/XECZcwMhxcy9HjfJLPibJEHXWG8D2
         okeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787686467; x=1788291267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMrfhsBi6zPSDyFzFiYlc0JlOzKBdsUewsQmdVbuEb4=;
        b=XBNYgZFmMx5BuccFc8a/DVgiSD8Vcoz5maSAoylwJJYSeHP58mjYm6ojQNubmj3lKX
         PkV1FDQBvnaQXuf4e0pvgbg3MIFwEFvw6seGFW5/ge4IbrSnhIrVZ+T6BAu7nxe/2V2Q
         TEoc7TciNDOiDxCSU33aYRuE3tFJlRIQnVlxS8roc9vt3kp1hL73cHIA13hn/bl2d9Hu
         DHRpfnYnZ1RPFh1CBhKmbFNgYhXUcm4zjnKoeiBQCRSvOkOasGO7YXcY4Jb5X97lf2bm
         lzLYekAf5AH1akTpkG6hjM5bv+dj3wKSkUaer7Xra0Ozij4SMPXD5Tr/9iX5o7B9yM0S
         y0ew==
X-Forwarded-Encrypted: i=1; AHgh+Rqss/xyq260As3nDxpXQQjmrxFY6FuXTdcA0blA2AiHyMBY7uuJL9KpKz8w0oeUb3m+yWBFJ6sm6wGUHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l/nO50hC92WZRunrBqIXeiRDAtsEdd9SvqStGKGlrk8sLJIhY0
	3hpsSjdWaJZq6TaGz1u3EVqyR8MG9zj7+qna2cVdaSbRf3rC8UUQ7M7i/2e8WTzaOcL4Fq4dYqN
	QgYGi+LMGnUPsmFXQAX5sJ0NOB89ACEA=
X-Gm-Gg: AR+sD11btE314fo0CMqJYEkte3ua2pTmjuRwcOay4n22c7hdol83Th4xSoZnG6bKy+l
	5IbTxv4/Xu2UuNEL8Htnb2YDz5PulGwNDgP03fGjwPqWtqHsfKGzfU8+V2S4hSoniGVRDR9mtLG
	2MpCK5FC06y7ehvCMJUJpOE2ytPLHoyREfbGcA7y68lxqlytYhr1YDUpl9HhLDbFG/6wAzNABKr
	BtBNqptMWHEKU6pQZ2Fro+bwGHpOkzg/RGgZ+Pkhyoil8Gxn2hBLJmU80+Sr9+4LGyneHKdMor4
	ErYEP25EKQ0BF+tp72KQv2kuoY75PTeNqq2JSq6pdMFV5g==
X-Received: by 2002:a05:6214:b67:b0:8ef:e3c9:533e with SMTP id
 6a1803df08f44-90cc7870ea3mr12057576d6.9.1787686467012; Tue, 25 Aug 2026
 12:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-4-mradityadash@gmail.com>
In-Reply-To: <20260821214728.87773-4-mradityadash@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 25 Aug 2026 12:34:15 -0700
X-Gm-Features: AcwNN1VSM8fkw6WOEHZ7PWo2YmSEOOHnsP9RsH1AMkYD6qkAtJNuymH4djkm6as
Message-ID: <CAFqHKT=ozs1i1GwTwhh_A3DQauvn78cL8GHvJJGz+arRsZ=1Vg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
To: Aditya Dash <mradityadash@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:47=E2=80=AFPM Aditya Dash <mradityadash@gmail.com=
> wrote:
>

Hi Aditya,

Thank you for taking on this task. It has been on my to-do list for
far too long and is a much requested feature. I took the liberty of
reviewing the documentation provided from Lenovo and have some
insights that will need some testing.

> Legion Go firmware keeps its custom fan curve in a separate Fan Method WM=
I
> interface. Method 5 returns ten control values and ten temperatures, whil=
e
> Method 6 replaces the complete table.

According to the documentation, these methods should be available in
the "Legacy" LENOVO_FAN_MENTHOD GUID you've implemented here and the
newer LENOVO_OTHER_METHOD GUID:
Class LENOVO_FAN_METHOD
GUID guid("{92549549-4bde-4f06-ac04-ce8bf898dbaa}")
Class LENOVO_OTHER_METHOD =EF=BC=88GetFeatureValue/ SetFeatureValue=EF=BC=
=89
GUID guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}")

Given that, It might be more prudent to implement this directly into
lenovo-wmi-other and add the older GUID. They appear to be 1:1
compatible regardless of which GUID you use. We'll need to ensure the
methods not implemented by the fan method GUID are gated adequately if
we go that route. Alternatively, we should be able to instantiate
another driver on the other method GUID similtaniously. That would
still require some cross driver notifiers, but either option would
prevent needing duplicate code in two places for devices that
implement one vs the other. I'd be interested to hear Armin/Ilpo's
thoughts on this as well before we decide on a direction there.

> The GUID also appears on Lenovo systems with a different table layout.
> Limit the driver to Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2,
> Legion Go S 8ARP1, and Legion Go S 8APU1 products. These products use the
> same ten-point layout and Method 6 request.

We should attempt to ensure the interface works universally.

Here is the BMOF data for the interface:
[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
Description("LENOVO_FAN_METHOD class"),
guid("{92549549-4bde-4f06-ac04-ce8bf898dbaa}")]
class LENOVO_FAN_METHOD {
  [key, read] string InstanceName;
  [read] boolean Active;

  [WmiMethodId(5), Implemented, Description("Get Fan Table ")] void
Fan_Get_Table([in] uint8 FanID, [in] uint8 SensorID, [out] uint32
FanTableSize, [out, WmiSizeIs("FanTableSize")] uint32 FanTable[],
[out] uint32 SensorTableSize, [out, WmiSizeIs("SensorTableSize")]
uint32 SensorTable[]);
  [WmiMethodId(6), Implemented, Description("Set Fan Table ")] void
Fan_Set_Table([in, Max(64)] uint8 FanTable[]);
};

As you can see, the FanTableSize u32 and SensorTableSize u32's provide
the length of both the temperature and fan speed set points. The Go
series happens to be 10, but we should query this on probe and
dynamically add the number of pwm1_auto_point_pwm/temp attributes
needed. They can be instantiated with an index, so recalling a
specific arbitrary attribute shouldn't be a challenge for reporting
the current value or changing a specific value. To do that, we'll need
to switch to using devm_hwmon_device_register_with_info()

That would allow dropping the DMI table entirely while adding support
for a lot more hardware.

> The curve applies to the same fan as the existing Other Mode attributes.
> Add a separate WMI driver and attach the ten automatic-point pairs to the
> HWMON device that Other Mode already provides. Match devices from the sam=
e
> WMI provider. Other Mode continues to work without Fan Method. Probe does
> not invoke either method.
>
> Validate both counts, every control value, and the complete temperature
> table before using a Method 5 reply. A point write holds the mutex while
> it reads the current table, changes one control value, and submits the
> complete Method 6 request. The other values remain unchanged.
>
> The HWMON mapping is not clear. On the tested Legion Go 8APU1, the fan
> responds to values from 0 through 115. This is Lenovo's 0 through 115
> percent range. Lenovo software shows 0 through 100 percent to the user,
> and 115 reaches the RPM observed in Full Speed mode. Firmware accepts
> values through 255, but values above 115 caused no observed RPM increase.

As others have stated, we should scale these inputs from 0-255 for all
hwmon character files. That being said, I'm on the fence about the
115% concept. There is nothing in the docs that desribes these limits
or a way to probe the max for a specific device, so I'm inclined to
treat anything above 100 as invalid.

> This RFC exposes the firmware values unchanged. The fixed temperatures ar=
e
> read-only.

Is there a reason for this? The temp table shold be editable to an
extent. Given that the hardware will reject unsupported values, it
seems as though we could store the old value and re-query after
setting to determine inf -EINVAL conditions were met.

One other thing to consider is this usage note from the docs. Note
that Custom Mode below refers to the GUID for hte methods, not the
custom profile:

5.4 Custom Mode Fan Table Rule:
In custom mode, the user adjusts the power limit, and the fan table
should be adjusted accordingly according to the total power limit.  If
the value of the fan table set by the user is lower than the reference
value of the fan table corresponding to the power limit at that time,
the value of the fan table of this order will be automatically
replaced.
C - Current Total Power Consumption set by user
Q - Quiet Mode Total Power Consumption
B - Balance Mode Total Power Consumption
P - Performance Mode Total Power Consumption

C<=3D Q
The value of Fan table cannot be lower than the value of Quiet Mode
Fan Table in Custom Mode
Q< C <=3D B
The value of Fan table cannot be lower than the value of Balance Mode
Fan Table in Custom Mode
B<C<=3D P
The value of Fan table cannot be lower than the value of Performance
Mode Fan Table in Custom Mode
P<C
The value of Fan table cannot be lower than the value of Performance
Mode Fan Table in Custom Mode +
Last order greater than 50db (52db, 54db or 55db) in Custom Mode


One other piece of the puzzle to consider as well. There is a
LENOVO_FAN_TABLE_DATA data block:
[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
Description("Definition of Fan Table list"),
guid("{87fb2a6d-d802-48e7-9208-4576c5f5c8d8}")]
class LENOVO_FAN_TABLE_DATA {
  [key, read] string InstanceName;
  [read] boolean Active;
  [WmiDataId(1), read, Description("Mode.")] uint16 Mode;
  [WmiDataId(2), read, Description("Fan ID.")] uint16 Fan_Id;
  [WmiDataId(3), read, Description("Fan Table Len.")] uint32 FanTable_Len;
  [WmiDataId(4), read, Description("Fan Table Data."),
WmiSizeIs("FanTable_Len")] uint16 FanTable_Data[];
  [WmiDataId(5), read, Description("Sensor ID.")] uint32 Sensor_ID;
  [WmiDataId(6), read, Description("Sensor Table Len.")] uint32 SensorTable=
_Len;
  [WmiDataId(7), read, Description("Sensor Table Data."),
WmiSizeIs("SensorTable_Len")] uint16 SensorTable_Data[];
  [WmiDataId(8), read, Description("Start Upwards Adjust Number.")]
uint8 StartOnlyUpwardAdjustNumber;
  [WmiDataId(9), read, Description("End Upwards Adjust Number.")]
uint8 EndOnlyUpwardAdjustNumber;
  [WmiDataId(10), read, Description("Current Fan Max Speed.")] uint16
CurrentFanMaxSpeed;
  [WmiDataId(11), read, Description("Start Downwards Adjust Number")]
uint8 DesignMaxFanSpeedNumber;
  [WmiDataId(12), read, Description("End Downwards Adjust Number")]
uint8 Reserved;
  [WmiDataId(13), read, Description("Current Fan Min Speed.")] uint16
CurrentFanMinSpeed;
  [WmiDataId(14), read, Description("Fan Speed Step.")] uint16 FanSpeedStep=
;
  [WmiDataId(15), read, Description("Max Sensor Temperature.")] uint16
MaxSensorTemperature;
  [WmiDataId(16), read, Description("Min Sensor Temperature.")] uint16
MinSensorTemperature;
  [WmiDataId(17), read, Description("Max Sensor Temperature.")] uint16
SensorTemperatureStep;
};

I only checked on the Go 2, that device has an empty data table for
all 15 instances and the method is stubbed in DSDT, but there is
likely some laptops out there that populate this data. It should work
similarly to the existing capdata/fan test data interfaces so it may
be worth considering getting hardware limits from that, if available,
and only doing the re-query when reliable data isn't available.

I'll hold off on reviewing the rest of the substance of the driver
until you've had a chance to adjust based on feedback. Most of what I
would have brought up was covered by others already.

Thanks,
Derek

> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
>  .../wmi/devices/lenovo-wmi-other.rst          |   3 +
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c       |  97 ++++-
>  7 files changed, 520 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-fan-method.rst b/Docume=
ntation/wmi/devices/lenovo-wmi-fan-method.rst
> new file mode 100644
> index 000000000000..67c9a92ed992
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Lenovo Fan Method WMI Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +WMI GUID ``92549549-4BDE-4F06-AC04-CE8BF898DBAA``
> +
> +The Lenovo Fan Method interface provides a ten-point firmware fan table =
on
> +Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2, Legion Go S 8ARP1, an=
d
> +Legion Go S 8APU1 products.
> +
> +The driver adds ``pwm1_auto_point1_*`` through
> +``pwm1_auto_point10_*`` to the HWMON device that the Lenovo Other Mode d=
river
> +owns. The temperature attributes are fixed and read-only. They contain p=
oints
> +from 10 through 100 degrees Celsius in 10-degree steps.
> +
> +Each ``pwm1_auto_point*_pwm`` attribute is read-write and passes a firmw=
are
> +control value from 0 through 255 without scaling. On the tested Legion G=
o
> +8APU1, the hardware responds from 0 through 115, corresponding to Lenovo=
's
> +0 through 115 percent range. Lenovo software shows 0 through 100 percent=
 to
> +the user, and 115 percent reaches the RPM observed in Full Speed mode. T=
he
> +firmware accepts values through 255, but values above 115 caused no obse=
rved
> +RPM increase.
> +
> +A control-value read validates both ten-entry tables before returning da=
ta. A
> +point write reads the current table, changes one control value, and subm=
its the
> +complete request. It preserves the other nine control values and all ret=
urned
> +temperatures.
> +
> +The Fan Method and Other Mode drivers use separate modules and WMI devic=
es.
> +The component framework associates devices that belong to the same WMI
> +provider. Fan Method curve attributes are absent when either interface i=
s not
> +available.
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index c93e9e6f3fd0..34352dbd6fb9 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -60,6 +60,9 @@ Some Legion Go firmware does not advertise fan 1 RPM th=
rough Capability
>  Data. In that case, the driver reads Other Mode feature ``0x04030001`` f=
or
>  ``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
>
> +When the separate Lenovo Fan Method driver binds to the same WMI provide=
r, it
> +adds ten automatic fan-curve points to this HWMON device.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3820b286f09f..8612c2323540 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14689,6 +14689,7 @@ M:      Mark Pearson <mpearson-lenovo@squebb.ca>
>  M:     Derek J. Clark <derekjohn.clark@gmail.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained
> +F:     Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  F:     Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:     Documentation/wmi/devices/lenovo-wmi-other.rst
>  F:     drivers/platform/x86/lenovo/*
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 4443f40ef8aa..e69942ce3093 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -276,3 +276,14 @@ config LENOVO_WMI_TUNING
>
>           To compile this driver as a module, choose M here: the module w=
ill
>           be called lenovo-wmi-other.
> +
> +config LENOVO_WMI_FAN_METHOD
> +       tristate "Lenovo Fan Method WMI Driver"
> +       depends on DMI
> +       depends on LENOVO_WMI_TUNING
> +       help
> +         Say Y here to add the firmware fan table on supported Lenovo
> +         Legion Go products to the Lenovo Other Mode HWMON device.
> +
> +         To compile this driver as a module, choose M here: the module w=
ill
> +         be called lenovo-wmi-fan-method.
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/=
lenovo/Makefile
> index 91a9370f11b3..171a19e01479 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -17,6 +17,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)     +=3D wmi-=
events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D wmi-helpers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D wmi-gamezone.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)      +=3D wmi-other.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_FAN_METHOD)  +=3D wmi-fan-method.o
>
>  # Add 'lenovo' prefix to each module listed in lenovo-target-*
>  define LENOVO_OBJ_TARGET
> diff --git a/drivers/platform/x86/lenovo/wmi-fan-method.c b/drivers/platf=
orm/x86/lenovo/wmi-fan-method.c
> new file mode 100644
> index 000000000000..4f29c4134caf
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/wmi-fan-method.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Fan Method WMI interface driver.
> + *
> + * This driver exposes the firmware fan table through HWMON automatic-po=
int
> + * attributes on selected Lenovo Legion Go products.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#define LENOVO_FAN_METHOD_GUID "92549549-4BDE-4F06-AC04-CE8BF898DBAA"
> +
> +#define LENOVO_FAN_METHOD_GET_CURVE    5
> +#define LENOVO_FAN_METHOD_SET_CURVE    6
> +#define LENOVO_FAN_CURVE_POINTS                10
> +#define LENOVO_FAN_CURVE_REPLY_SIZE    88
> +#define LENOVO_FAN_CURVE_WRITE_SIZE    64
> +
> +#define LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET    0
> +#define LENOVO_FAN_REPLY_SPEED_OFFSET          4
> +#define LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET     44
> +#define LENOVO_FAN_REPLY_TEMP_OFFSET           48
> +
> +#define LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET    2
> +#define LENOVO_FAN_WRITE_SPEED_OFFSET          6
> +#define LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET      26
> +#define LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET     27
> +#define LENOVO_FAN_WRITE_TEMP_OFFSET           31
> +#define LENOVO_FAN_WRITE_TRAILER_OFFSET                51
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET  53
> +
> +#define LENOVO_FAN_WRITE_TEMP_TYPE             1
> +#define LENOVO_FAN_WRITE_TRAILER               0x5a
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE         100
> +
> +static const struct dmi_system_id lwmi_fan_dmi_table[] =3D {
> +       {
> +               .ident =3D "Lenovo Legion Go 8APU1",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8=
APU1"),
> +               },
> +       },
> +       {
> +               .ident =3D "Lenovo Legion Go S 8APU1",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S=
 8APU1"),
> +               },
> +       },
> +       {
> +               .ident =3D "Lenovo Legion Go S 8ARP1",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S=
 8ARP1"),
> +               },
> +       },
> +       {
> +               .ident =3D "Lenovo Legion Go 8ASP2",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8=
ASP2"),
> +               },
> +       },
> +       {
> +               .ident =3D "Lenovo Legion Go 8AHP2",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8=
AHP2"),
> +               },
> +       },
> +       {}
> +};
> +
> +static const u16 lwmi_fan_temperatures[LENOVO_FAN_CURVE_POINTS] =3D {
> +       10, 20, 30, 40, 50, 60, 70, 80, 90, 100
> +};
> +
> +struct lwmi_fan_method_curve {
> +       u16 speed[LENOVO_FAN_CURVE_POINTS];
> +       u16 temperature[LENOVO_FAN_CURVE_POINTS];
> +};
> +
> +struct lwmi_fan_method_priv;
> +
> +struct lwmi_fan_method_attr {
> +       struct device_attribute dev_attr;
> +       struct lwmi_fan_method_priv *priv;
> +       u8 index;
> +};
> +
> +struct lwmi_fan_method_priv {
> +       struct wmi_device *wdev;
> +       struct mutex lock; /* Serializes all Fan Method calls. */
> +       struct lwmi_fan_method_attr point_attrs[LENOVO_FAN_CURVE_POINTS *=
 2];
> +       struct attribute *attrs[LENOVO_FAN_CURVE_POINTS * 2 + 1];
> +       struct attribute_group group;
> +};
> +
> +static int lwmi_fan_method_get_curve(struct lwmi_fan_method_priv *priv,
> +                                    struct lwmi_fan_method_curve *curve)
> +{
> +       u8 input[] =3D { 1, 1 };
> +       struct wmi_buffer in =3D {
> +               .length =3D sizeof(input),
> +               .data =3D input,
> +       };
> +       struct wmi_buffer out =3D {};
> +       const u8 *buffer;
> +       int ret, i;
> +
> +       ret =3D wmidev_invoke_method(priv->wdev, 0,
> +                                  LENOVO_FAN_METHOD_GET_CURVE, &in, &out=
,
> +                                  LENOVO_FAN_CURVE_REPLY_SIZE);
> +       if (ret)
> +               return ret;
> +
> +       buffer =3D out.data;
> +       if (get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_COUNT_OFFS=
ET) !=3D
> +           LENOVO_FAN_CURVE_POINTS ||
> +           get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_COUNT_OFFSE=
T) !=3D
> +           LENOVO_FAN_CURVE_POINTS) {
> +               ret =3D -ERANGE;
> +               goto out_free;
> +       }
> +
> +       for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +               u32 speed =3D get_unaligned_le32(buffer + LENOVO_FAN_REPL=
Y_SPEED_OFFSET +
> +                                              i * sizeof(u32));
> +               u32 temperature =3D
> +                       get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP=
_OFFSET +
> +                                          i * sizeof(u32));
> +
> +               if (speed > U8_MAX || temperature !=3D lwmi_fan_temperatu=
res[i]) {
> +                       ret =3D -ERANGE;
> +                       goto out_free;
> +               }
> +
> +               curve->speed[i] =3D speed;
> +               curve->temperature[i] =3D temperature;
> +       }
> +
> +out_free:
> +       kfree(out.data);
> +       return ret;
> +}
> +
> +static int lwmi_fan_method_set_curve(struct lwmi_fan_method_priv *priv,
> +                                    const struct lwmi_fan_method_curve *=
curve)
> +{
> +       u8 buffer[LENOVO_FAN_CURVE_WRITE_SIZE] =3D { 0xff, 0x01 };
> +       struct wmi_buffer in =3D {
> +               .length =3D sizeof(buffer),
> +               .data =3D buffer,
> +       };
> +       int i;
> +
> +       put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +                          buffer + LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET);
> +       for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +               put_unaligned_le16(curve->speed[i],
> +                                  buffer + LENOVO_FAN_WRITE_SPEED_OFFSET=
 +
> +                                  i * sizeof(u16));
> +
> +       buffer[LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET] =3D LENOVO_FAN_WRITE_TE=
MP_TYPE;
> +       put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +                          buffer + LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET);
> +       for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +               put_unaligned_le16(curve->temperature[i],
> +                                  buffer + LENOVO_FAN_WRITE_TEMP_OFFSET =
+
> +                                  i * sizeof(u16));
> +
> +       buffer[LENOVO_FAN_WRITE_TRAILER_OFFSET] =3D LENOVO_FAN_WRITE_TRAI=
LER;
> +       put_unaligned_le16(LENOVO_FAN_WRITE_TRAILER_VALUE,
> +                          buffer + LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET=
);
> +
> +       return wmidev_invoke_procedure(priv->wdev, 0,
> +                                      LENOVO_FAN_METHOD_SET_CURVE, &in);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{
> +       struct lwmi_fan_method_attr *point_attr =3D
> +               container_of(attr, struct lwmi_fan_method_attr, dev_attr)=
;
> +       struct lwmi_fan_method_priv *priv =3D point_attr->priv;
> +       struct lwmi_fan_method_curve curve;
> +       int ret;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       ret =3D lwmi_fan_method_get_curve(priv, &curve);
> +       if (ret)
> +               return ret;
> +
> +       return sysfs_emit(buf, "%u\n", curve.speed[point_attr->index]);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_store(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        const char *buf, size_t count)
> +{
> +       struct lwmi_fan_method_attr *point_attr =3D
> +               container_of(attr, struct lwmi_fan_method_attr, dev_attr)=
;
> +       struct lwmi_fan_method_priv *priv =3D point_attr->priv;
> +       struct lwmi_fan_method_curve curve;
> +       unsigned long pwm;
> +       int ret;
> +
> +       ret =3D kstrtoul(buf, 10, &pwm);
> +       if (ret)
> +               return ret;
> +       if (pwm > U8_MAX)
> +               return -EINVAL;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       ret =3D lwmi_fan_method_get_curve(priv, &curve);
> +       if (ret)
> +               return ret;
> +
> +       curve.speed[point_attr->index] =3D pwm;
> +       ret =3D lwmi_fan_method_set_curve(priv, &curve);
> +
> +       return ret ? ret : count;
> +}
> +
> +static ssize_t lwmi_fan_method_temp_show(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        char *buf)
> +{
> +       struct lwmi_fan_method_attr *point_attr =3D
> +               container_of(attr, struct lwmi_fan_method_attr, dev_attr)=
;
> +
> +       return sysfs_emit(buf, "%u\n",
> +                         lwmi_fan_temperatures[point_attr->index] * 1000=
);
> +}
> +
> +#define LWMI_FAN_METHOD_POINT_NAMES(_point) \
> +       "pwm1_auto_point" #_point "_pwm", \
> +       "pwm1_auto_point" #_point "_temp"
> +
> +static const char * const lwmi_fan_method_attr_names[] =3D {
> +       LWMI_FAN_METHOD_POINT_NAMES(1),
> +       LWMI_FAN_METHOD_POINT_NAMES(2),
> +       LWMI_FAN_METHOD_POINT_NAMES(3),
> +       LWMI_FAN_METHOD_POINT_NAMES(4),
> +       LWMI_FAN_METHOD_POINT_NAMES(5),
> +       LWMI_FAN_METHOD_POINT_NAMES(6),
> +       LWMI_FAN_METHOD_POINT_NAMES(7),
> +       LWMI_FAN_METHOD_POINT_NAMES(8),
> +       LWMI_FAN_METHOD_POINT_NAMES(9),
> +       LWMI_FAN_METHOD_POINT_NAMES(10),
> +};
> +
> +#undef LWMI_FAN_METHOD_POINT_NAMES
> +
> +static void lwmi_fan_method_attrs_init(struct lwmi_fan_method_priv *priv=
)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +               struct lwmi_fan_method_attr *pwm =3D &priv->point_attrs[i=
 * 2];
> +               struct lwmi_fan_method_attr *temp =3D &priv->point_attrs[=
i * 2 + 1];
> +
> +               sysfs_attr_init(&pwm->dev_attr.attr);
> +               pwm->dev_attr.attr.name =3D lwmi_fan_method_attr_names[i =
* 2];
> +               pwm->dev_attr.attr.mode =3D 0644;
> +               pwm->dev_attr.show =3D lwmi_fan_method_pwm_show;
> +               pwm->dev_attr.store =3D lwmi_fan_method_pwm_store;
> +               pwm->priv =3D priv;
> +               pwm->index =3D i;
> +               priv->attrs[i * 2] =3D &pwm->dev_attr.attr;
> +
> +               sysfs_attr_init(&temp->dev_attr.attr);
> +               temp->dev_attr.attr.name =3D lwmi_fan_method_attr_names[i=
 * 2 + 1];
> +               temp->dev_attr.attr.mode =3D 0444;
> +               temp->dev_attr.show =3D lwmi_fan_method_temp_show;
> +               temp->index =3D i;
> +               priv->attrs[i * 2 + 1] =3D &temp->dev_attr.attr;
> +       }
> +
> +       priv->group.attrs =3D priv->attrs;
> +}
> +
> +static int lwmi_fan_method_master_bind(struct device *dev)
> +{
> +       struct lwmi_fan_method_priv *priv =3D dev_get_drvdata(dev);
> +
> +       return component_bind_all(dev, &priv->group);
> +}
> +
> +static void lwmi_fan_method_master_unbind(struct device *dev)
> +{
> +       component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_fan_method_master_ops =3D =
{
> +       .bind =3D lwmi_fan_method_master_bind,
> +       .unbind =3D lwmi_fan_method_master_unbind,
> +};
> +
> +static int lwmi_fan_method_component_compare(struct device *dev, void *d=
ata)
> +{
> +       struct device *master =3D data;
> +
> +       return dev->driver &&
> +               !strcmp(dev->driver->name, "lenovo_wmi_other") &&
> +               dev->parent =3D=3D master->parent;
> +}
> +
> +static int lwmi_fan_method_probe(struct wmi_device *wdev, const void *co=
ntext)
> +{
> +       struct component_match *master_match =3D NULL;
> +       struct lwmi_fan_method_priv *priv;
> +
> +       if (!dmi_check_system(lwmi_fan_dmi_table))
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->wdev =3D wdev;
> +       mutex_init(&priv->lock);
> +       lwmi_fan_method_attrs_init(priv);
> +       dev_set_drvdata(&wdev->dev, priv);
> +
> +       component_match_add(&wdev->dev, &master_match,
> +                           lwmi_fan_method_component_compare, &wdev->dev=
);
> +       if (IS_ERR(master_match))
> +               return PTR_ERR(master_match);
> +
> +       return component_master_add_with_match(&wdev->dev,
> +                                              &lwmi_fan_method_master_op=
s,
> +                                              master_match);
> +}
> +
> +static void lwmi_fan_method_remove(struct wmi_device *wdev)
> +{
> +       component_master_del(&wdev->dev, &lwmi_fan_method_master_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_fan_method_id_table[] =3D {
> +       { LENOVO_FAN_METHOD_GUID, NULL },
> +       {}
> +};
> +
> +static struct wmi_driver lwmi_fan_method_driver =3D {
> +       .driver =3D {
> +               .name =3D "lenovo_wmi_fan_method",
> +               .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +       },
> +       .id_table =3D lwmi_fan_method_id_table,
> +       .probe =3D lwmi_fan_method_probe,
> +       .remove =3D lwmi_fan_method_remove,
> +       .no_singleton =3D true,
> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_fan_method_id_table);
> +module_wmi_driver(lwmi_fan_method_driver);
> +
> +MODULE_AUTHOR("Aditya Dash <mradityadash@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Fan Method WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index b4be7739b243..72d3510b17b2 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -192,11 +192,13 @@ struct lwmi_om_priv {
>         struct device *fw_attr_dev;
>         struct kset *fw_attr_kset;
>         struct wmi_device *wdev;
> +       const struct attribute_group *fan_method_group;
>         int ida_id;
>
>         struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>         bool fullspeed_supported;
>         bool fan0_input_fallback;
> +       bool fan_method_group_added;
>
>         struct {
>                 bool capdata00_collected : 1;
> @@ -542,6 +544,31 @@ static const struct hwmon_chip_info lwmi_om_hwmon_ch=
ip_info =3D {
>         .info =3D lwmi_om_hwmon_info,
>  };
>
> +static int lwmi_om_fan_method_group_add(struct lwmi_om_priv *priv)
> +{
> +       int ret;
> +
> +       if (!priv->hwmon_dev || !priv->fan_method_group ||
> +           priv->fan_method_group_added)
> +               return 0;
> +
> +       ret =3D sysfs_create_group(&priv->hwmon_dev->kobj,
> +                                priv->fan_method_group);
> +       if (!ret)
> +               priv->fan_method_group_added =3D true;
> +
> +       return ret;
> +}
> +
> +static void lwmi_om_fan_method_group_remove(struct lwmi_om_priv *priv)
> +{
> +       if (!priv->hwmon_dev || !priv->fan_method_group_added)
> +               return;
> +
> +       sysfs_remove_group(&priv->hwmon_dev->kobj, priv->fan_method_group=
);
> +       priv->fan_method_group_added =3D false;
> +}
> +
>  /**
>   * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
>   * @priv: Driver private data
> @@ -550,9 +577,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  {
>         u32 rpm;
>         long enable;
> -       int i, valid;
> +       int i, ret, valid;
>
> -       if (WARN_ON(priv->hwmon_dev))
> +       if (priv->hwmon_dev)
>                 return;
>
>         if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capd=
ata_fan_collected) {
> @@ -592,7 +619,8 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>                 }
>         }
>
> -       if (valid =3D=3D 0 && !priv->fullspeed_supported && !priv->fan0_i=
nput_fallback) {
> +       if (valid =3D=3D 0 && !priv->fullspeed_supported &&
> +           !priv->fan0_input_fallback && !priv->fan_method_group) {
>                 dev_warn(&priv->wdev->dev,
>                          "fan reporting/tuning is unsupported on this dev=
ice\n");
>                 return;
> @@ -609,6 +637,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *p=
riv)
>                 return;
>         }
>
> +       ret =3D lwmi_om_fan_method_group_add(priv);
> +       if (ret)
> +               dev_warn(&priv->wdev->dev,
> +                        "failed to register Fan Method attributes: %d\n"=
, ret);
> +
>         dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
>  }
>
> @@ -623,6 +656,7 @@ static void lwmi_om_hwmon_remove(struct lwmi_om_priv =
*priv)
>         if (!priv->hwmon_dev)
>                 return;
>
> +       lwmi_om_fan_method_group_remove(priv);
>         hwmon_device_unregister(priv->hwmon_dev);
>         priv->hwmon_dev =3D NULL;
>  }
> @@ -1801,10 +1835,44 @@ static const struct component_master_ops lwmi_om_=
master_ops =3D {
>         .unbind =3D lwmi_om_master_unbind,
>  };
>
> +static int lwmi_om_fan_method_component_bind(struct device *component,
> +                                            struct device *master, void =
*data)
> +{
> +       const struct attribute_group *group =3D data;
> +       struct lwmi_om_priv *priv =3D dev_get_drvdata(component);
> +       int ret;
> +
> +       if (!group)
> +               return -EINVAL;
> +
> +       priv->fan_method_group =3D group;
> +       lwmi_om_hwmon_add(priv);
> +       ret =3D lwmi_om_fan_method_group_add(priv);
> +       if (ret)
> +               priv->fan_method_group =3D NULL;
> +
> +       return ret;
> +}
> +
> +static void lwmi_om_fan_method_component_unbind(struct device *component=
,
> +                                               struct device *master, vo=
id *data)
> +{
> +       struct lwmi_om_priv *priv =3D dev_get_drvdata(component);
> +
> +       lwmi_om_fan_method_group_remove(priv);
> +       priv->fan_method_group =3D NULL;
> +}
> +
> +static const struct component_ops lwmi_om_fan_method_component_ops =3D {
> +       .bind =3D lwmi_om_fan_method_component_bind,
> +       .unbind =3D lwmi_om_fan_method_component_unbind,
> +};
> +
>  static int lwmi_other_probe(struct wmi_device *wdev, const void *context=
)
>  {
>         struct component_match *master_match =3D NULL;
>         struct lwmi_om_priv *priv;
> +       int ret;
>
>         priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -1816,16 +1884,31 @@ static int lwmi_other_probe(struct wmi_device *wd=
ev, const void *context)
>         priv->wdev =3D wdev;
>         dev_set_drvdata(&wdev->dev, priv);
>
> +       ret =3D component_add(&wdev->dev, &lwmi_om_fan_method_component_o=
ps);
> +       if (ret)
> +               return ret;
> +
>         lwmi_cd_match_add_all(&wdev->dev, &master_match);
> -       if (IS_ERR(master_match))
> -               return PTR_ERR(master_match);
> +       if (IS_ERR(master_match)) {
> +               ret =3D PTR_ERR(master_match);
> +               goto err_component;
> +       }
> +
> +       ret =3D component_master_add_with_match(&wdev->dev, &lwmi_om_mast=
er_ops,
> +                                             master_match);
> +       if (ret)
> +               goto err_component;
> +
> +       return 0;
>
> -       return component_master_add_with_match(&wdev->dev, &lwmi_om_maste=
r_ops,
> -                                              master_match);
> +err_component:
> +       component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +       return ret;
>  }
>
>  static void lwmi_other_remove(struct wmi_device *wdev)
>  {
> +       component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
>         component_master_del(&wdev->dev, &lwmi_om_master_ops);
>  }
>
> --
> 2.55.0
>
