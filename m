Return-path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
References: <20170404192034.158901-1-john@jmuir.com> <20170404192034.158901-3-john@jmuir.com>
 <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Apr 2017 10:44:06 -0500
Message-ID: <CAL_Jsq+J4g2JDFgdcrYbZ27jXV7_D3fCd_8doRW=rcKEQnmsCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] devicetree: Document the max31760 device binding.
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Anatol Pomazau <anatol@google.com>,
	Mark Segal <segal@google.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Apr 10, 2017 at 10:42 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Apr 04, 2017 at 12:20:34PM -0700, John Muir wrote:
>> Signed-off-by: John Muir <john@jmuir.com>
>> ---
>>  .../devicetree/bindings/hwmon/max31760.txt         | 58 ++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/max31760.txt b/Documentation/devicetree/bindings/hwmon/max31760.txt
>> new file mode 100644
>> index 000000000000..43787a77c322
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/max31760.txt
>> @@ -0,0 +1,58 @@
>> +MAX31760 fan controller
>> +-----------------------
>> +
>> +This device supports I2C only. Many properties of this device are configurable
>> +thorugh the hwmon interface. See also Documentation/hwmon/max31760.
>
> I really think we need to describe the fans as separate nodes and
> preferably with a common binding. This is the second fan controller
> binding recently[1].

Forgot the link: https://patchwork.kernel.org/patch/9643643/
