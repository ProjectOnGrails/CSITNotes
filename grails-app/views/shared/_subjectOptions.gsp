<label for="subject">
    <select id="subject" name="subject">
        <option value="">Select Subject</option>
        <g:each in="${subjects}" var="subject">
            <option value="${subject.id}">${subject.name}</option>
        </g:each>
    </select>
</label>
